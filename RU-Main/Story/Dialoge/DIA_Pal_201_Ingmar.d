

instance DIA_Ingmar_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_Hallo (C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 2;
	condition = DIA_Ingmar_Hallo_Condition;
	information = DIA_Ingmar_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ingmar_Hello_permanent;

func int DIA_Ingmar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ingmar_Hallo_permanent == FALSE) && (Kapitel < 4) && (CITYHALLACCESSGRANTED == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if ((EnterOW_Chapter2 ==  FALSE ) && (LordHagen.aivar[AIV_TalkedToPlayer] ==  TRUE ))
	{
		AI_Output(self,other, " DIA_Ingmar_Hallo_06_00 " );	// According to reports I've received, the Valley of Mines is a dangerous place.
		AI_Output(self,other, " DIA_Ingmar_Hallo_06_01 " );	// Take care of your gear before you go there.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other, " DIA_Ingmar_Hallo_06_02 " );	// The situation in the Valley of Mines worries me greatly. But we will develop a plan to overcome all dangers and get our guys out of there along with the ore.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Ingmar_Hallo_06_03 " );	// I thought you came to talk to Lord Hagen. So go to him.
	};
};


instance DIA_Ingmar_Krieg (C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = " How are things on the mainland? " ;
};


func int DIA_Ingmar_Krieg_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other,self, " DIA_Ingmar_Krieg_15_00 " );	// How are things on the mainland?
	AI_Output(self,other, " DIA_Ingmar_Krieg_06_01 " );	// The war is not yet won, although the royal forces are already pushing the orcs.
	AI_Output(self,other, " DIA_Ingmar_Krieg_06_02 " );	// But small units of orcs appear here and there, trying to disperse our army.
	AI_Output(self,other, " DIA_Ingmar_Krieg_06_03 " );	// They fight without courage and without faith, and therefore in the end we are sure to win.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int DIA_Ingmar_CanTeach_Condition()
{
	if(Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Ingmar_CanTeach_15_00 " );	// Can you teach me something?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Ingmar_CanTeach_06_01 " );	// I can teach you how to become stronger so you can use your weapons more effectively.
		Ingmar_TeachSTR = TRUE;
		B_LogEntry(TOPIC_CityTeacher, " Paladin Ingmar can help me become stronger. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Ingmar_CanTeach_06_02 " );	// I only train followers of our order.
	};
};


instance DIA_Ingmar_Teach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};


func int DIA_Ingmar_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other,self, " DIA_Ingmar_Teach_15_00 " );	// I want to get stronger.
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};

func void DIA_Ingmar_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_Ingmar_Teach_06_00 " );	// You're as strong as a troll! I have nothing to teach you.
	};

	Info_ClearChoices(DIA_Ingmar_Teach);
};

func void DIA_Ingmar_Teach_RegenStam()
{
	var int cost;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_03 " );	// Teach me faster stamina recovery.

	cost = 10 ;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		AI_Print( " Tutorial: Accelerated Stamina Regeneration " );
		VATRAS_TEACHREGENSTAM = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};

func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if ((Chapter >=  3 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && (other.guild ==  GIL_PAL ))
	{
		Info_AddChoice(DIA_Ingmar_Teach, " Stamina Regeneration (Training Points: 10) " ,DIA_Ingmar_Teach_RegenStam);
	};
};


instance DIA_Ingmar_KAP3_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP3_EXIT_Condition;
	information = DIA_Ingmar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP4_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP4_EXIT_Condition;
	information = DIA_Ingmar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_ORKELITE (C_Info) .
{
	npc = Pal_201_Ingmar;
	nr = 40;
	condition = DIA_Ingmar_ORKELITE_Condition;
	information = DIA_Ingmar_ORKELITE_Info;
	description = " Orcs are preparing a massive attack. " ;
};


func int DIA_Ingmar_ORKELITE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing)) && (Hagen_SawOrcRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other,self, " DIA_Ingmar_ORKELITE_15_00 " );	// Orcs are preparing a massive offensive.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_06_01 " );	// huh? Well, this is very interesting. And how do you know this?
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self, " DIA_Ingmar_ORKELITE_15_02 " );	// I spoke to them.
	};
	AI_Output(other,self, " DIA_Ingmar_ORKELITE_15_03 " );	// Their leaders have appeared in this area.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_06_04 " );	// Mmm. This doesn't sound like a typical Ork strategy.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE, " You need to find a way to rid us of them. " ,DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE, " What do we do now? " ,DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE, " What does this mean? " ,DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite, " Ingmar was very interested in the story about the elite Orc warriors. " );
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_get rid of()
{
	AI_Output(other,self, " DIA_Ingmar_ORKELITE_loswerden_15_00 " );	// You need to find a way to rid us of them.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_loswerden_06_01 " );	// It would be nice if we had more detailed information. I'll send someone to scout the area.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self, " DIA_Ingmar_ORKELITE_wieso_15_00 " );	// What does this mean?
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wieso_06_01 " );	// If what you're saying is true, that means they're hoping to weaken us from within by striking out with their best warriors.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wieso_06_02 " );	// Usually each orc horde is led by one leader. It is extremely rare to meet two or more together.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wieso_06_03 " );	// There is a reason for this. Their leaders are the core of their offensive strategy, and are usually surrounded by simple orc warriors.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wieso_06_04 " );	// Therefore, it is very difficult to get close to any of them without breaking through a horde of at least 30 warriors.
	B_LogEntry(TOPIC_OrcElite, " Ingmar said something about the head of the orc leaders. " );
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self, " DIA_Ingmar_ORKELITE_wasTun_15_00 " );	// What do we do now?
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wasTun_06_01 " );	// When they meet in such numbers, it's usually a commando group led by a senior in rank.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wasTun_06_02 " );	// This high-ranking leader sets up his headquarters in one of the caves, from where he directs his troops into battle.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wasTun_06_03 " );	// If we could get to this orc warlord, we'd have a decisive advantage.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wasTun_06_04 " );	// An orc warlord generally prefers to be in close proximity to his enemies. I would advise looking for his cave somewhere near the city.
	AI_Output(self,other, " DIA_Ingmar_ORKELITE_wasTun_06_05 " );	// Several orcs have been spotted near Lobart's farm. Maybe you should try starting your search from there?
	B_LogEntry(TOPIC_OrcElite, " According to Ingmar, I should find the orc colonel in a cave somewhere near Lobart's farm. Ingmar wants me to find and kill him. " );
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER (C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = " I was able to find the orc headquarters. " ;
};


func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if ( Npc_IsDead ( OrkElite_AntiPaladinOrkColonel ) && Npc_KnowsInfo ( other , DIA_Ingmar_ORKELITE ) )
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other,self, " DIA_Ingmar_HAUPTQUARTIER_15_00 " );	// I was able to find the orc headquarters. Their commander has fallen.
	AI_Output(self,other, " DIA_Ingmar_HAUPTQUARTIER_06_01 " );	// This is great news. Now the orcs will be at a loss for some time.
	AI_Output(self,other, " DIA_Ingmar_HAUPTQUARTIER_06_02 " );	// That's not bad. If we had more knights like you, we wouldn't have to worry about the outcome of the upcoming battle.
	AI_Output(self,other, " DIA_Ingmar_HAUPTQUARTIER_06_03 " );	// Here. Take this gold. I hope it helps you buy good gear.
	B_GivePlayerXP(XP_KilledOrkOberst);
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_KillOrkOberst = LOG_SUCCESS;
};


instance DIA_Ingmar_KAP5_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP5_EXIT_Condition;
	information = DIA_Ingmar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP6_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP6_EXIT_Condition;
	information = DIA_Ingmar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ingmar_PICKPOCKET(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 900;
	condition = DIA_Ingmar_PICKPOCKET_Condition;
	information = DIA_Ingmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his scroll) " ;
};

func int DIA_Ingmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,Dialog_Back,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItSc_PalLight,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
};


instance DIA_INGMAR_ABOUTORKS(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 1;
	condition = dia_ingmar_aboutorks_condition;
	information = dia_ingmar_aboutorks_info;
	permanent = FALSE;
	description = " Do you know anything about orcs? " ;
};


func int dia_ingmar_aboutorks_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Ingmar_ORKELITE ))
	{
		return TRUE;
	};
};

func void dia_ingmar_aboutorks_info()
{
	AI_Output(other,self, " DIA_Ingmar_AboutOrks_01_00 " );	// Do you know anything about orcs?
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_01 " );	// Do I know anything about orcs? Man, I'm the best expert on these monsters in the whole kingdom!
	AI_Output(other,self, " DIA_Ingmar_AboutOrks_01_04 " );	// Then you can probably tell me a lot of interesting things about them.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_07 " );	// Okay, listen. Many people consider orcs to be rather primitive creatures.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_08 " );	// But in fact, these creatures have their own strict military hierarchy, which is quite effective in terms of organization.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_09 " );	// And, as you can see, it brought them pretty good results in the war with us.
	AI_Output(other,self, " DIA_Ingmar_AboutOrks_01_10 " );	// What is this hierarchy?
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_11 " );	// The first step in it is occupied by orc warriors - this is the main combat unit of their army. In the orc language, these warriors are called GRASH-RAMTOR!
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_12 " );	// They wear light mail armor and are not particularly dangerous opponents even for a simple hunter.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_13 " );	// Such orcs usually do not know the art of battle, and try to crush their enemy with simple numerical superiority.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_14 " );	// It won't be too hard to defeat such a monster.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_16 " );	// Next in rank are Black Orc Warriors or ERZMRAX-KORRGRON! They are very strong and proficient with melee weapons.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_17 " );	// A fight with such an opponent will be a serious test for any experienced warrior. Therefore, try to avoid meeting with them if you do not have strong armor.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_18 " );	// Elite Black Orc Warriors are even more dangerous! They are called TARSCHMORE-GRONSROCK, and this opponent is already a very serious test even for an experienced knight.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_19 " );	// Heavy armor reliably protects them from swords and axes. And on top of that, they are also armed with heavy crossbows that can easily pierce the most durable armor.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_21 " );	// Next, following them in rank are GRAX-NARZULG - elite black orc elders.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_22 " );	// They are an order of magnitude stronger than ordinary warriors, and their competence includes commanding small units of orcs.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_23 " );	// They can't be found in large numbers, but they're just as hard to fight as they are us paladins of Innos.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_24 " );	// That's why the Elite Black Orc Elders are our biggest opponents on the battlefield!
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_25 " );	// Next in the ork military hierarchy are ROR-GNORK - elite Orc warlords who command the Grax-Narzulg, directing and coordinating their actions.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_28 " );	// These elite orcs are skilled with swordsmanship and are well versed in combat tactics.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_29 " );	// If you lose focus for just a second, their huge sword will cut you in half!
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_32 " );	// And last on this list are the VRUSHMORE-KOGRON, the elite Ork leaders. It is they who control entire armies of orcs and lead them on the attack.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_33 " );	// To kill such an opponent is a great honor for any warrior - and for a paladin as well.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_34 " );	// True, they are shown on the battlefield in rather rare cases and, as a rule, accompanied by numerous guards.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_35 " );	// So in order to get through to them, you'll first have to take out a few dozen heavily armed guards first, and only then will you have a chance to kill such an enemy.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_37 " );	// Above them in rank are only the powerful leaders of the Horde. But I never saw them.
	AI_Output(self,other, " DIA_Ingmar_AboutOrks_01_39 " );	// And I have no idea what they look like or how strong they are.
};

instance DIA_Ingmar_CanTeachShield(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 5;
	condition = DIA_Ingmar_CanTeachShield_Condition;
	information = DIA_Ingmar_CanTeachShield_Info;
	permanent = FALSE;
	description = " I have a question for you. " ;
};

func int DIA_Ingmar_CanTeachShield_Condition()
{
	if(CedricSendIngmar == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeachShield_Info()
{
	AI_Output(other,self, " DIA_Ingmar_CanTeachShield_01_00 " );	// I have a question for you.
	AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_01 " );	// What are you interested in?
	AI_Output(other,self, " DIA_Ingmar_CanTeachShield_01_02 " );	// Cedric said you could get me a paladin shield.
	AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_03 " );	// Ah, that's... (grouchily) It looks like this stubborn bastard will only calm down when we all walk around with them behind their backs.
	AI_Output(other,self, " DIA_Ingmar_CanTeachShield_01_04 " );	// Do you disagree with him?
	AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_05 " );	// I'm a fan of the good old two-handed sword. And there is nothing better than him!
	AI_Output(other,self, " DIA_Ingmar_CanTeachShield_01_06 " );	// So what about the shield?
	AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_07 " );	// Well, if you insist so... Fine, I'll give you a paladin shield.
	AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_08 " );	// But in order to wear it, you must be proficient with one-handed weapons.

	if(hero.HitChance[NPC_TALENT_1H] >= 50)
	{
		AI_Output(other,self, " DIA_Ingmar_CanTeachShield_01_09 " );	// I'm pretty good at it.
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_10 " );	// (sighing) Well, okay. Here you are.
		B_GiveInvItems(self,other,ItAr_Shield_07,1);
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_11 " );	// Hope it serves you well in battle.
	}
	else
	{
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_13 " );	// And as far as I can tell, you're still not experienced enough.
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_01_14 " );	// Come back when you get better with a one-handed sword.
		NeedProofShield = TRUE;
	};
};

instance DIA_Ingmar_CanTeachShield_Perm(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 5;
	condition = DIA_Ingmar_CanTeachShield_Perm_Condition;
	information = DIA_Ingmar_CanTeachShield_Perm_Info;
	permanent = TRUE;
	description = " Give me a paladin's shield. " ;
};

func int DIA_Ingmar_CanTeachShield_Perm_Condition()
{
	if((NeedProofShield == TRUE) && (GetPalShield == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeachShield_Perm_Info()
{
	AI_Output(other,self, " DIA_Ingmar_CanTeachShield_Perm_01_00 " );	// Give me the paladin's shield.

	if(hero.HitChance[NPC_TALENT_1H] >= 50)
	{
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_Perm_01_01 " );	// What about your ability to fight with one-handed weapons?
		AI_Output(other,self, " DIA_Ingmar_CanTeachShield_Perm_01_02 " );	// I'm pretty good at it.
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_Perm_01_03 " );	// (sighing) Well, okay. Here you are.
		B_GiveInvItems(self,other,ItAr_Shield_07,1);
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_Perm_01_04 " );	// Hope it serves you well in battle.
		GetPalShield = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_Perm_01_06 " );	// I told you I'll only give it to you if you're good enough with a one-handed sword.
		AI_Output(self,other, " DIA_Ingmar_CanTeachShield_Perm_01_07 " );	// What's wrong here?
		Print ( " One-handed weapon proficiency over 50... " );
	};
};
