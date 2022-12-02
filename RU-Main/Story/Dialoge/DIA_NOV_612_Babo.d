

instance DIA_Babo_Kap1_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap1_EXIT_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Babo_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self,other, " DIA_Babo_Hello_03_00 " );	// Hello, you're new here too, right?
	AI_Output(other,self, " DIA_Babo_Hello_15_01 " );	// Yes. How long have you been here?
	AI_Output(self,other, " DIA_Babo_Hello_03_02 " );	// Four weeks. Have you been issued a battle staff yet?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Пока нет.
	AI_Output(self,other, " DIA_Babo_Hello_03_04 " );	// Then take this one. We novices always walk with a staff to show that we are capable of defending ourselves. Can you fight?
	B_GiveInvItems(self,other,ItMw_1h_Nov_Mace,1);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self, " DIA_Babo_Hello_15_05 " );	// Well, I used to use a weapon...
	AI_Output(self,other, " DIA_Babo_Hello_03_06 " );	// If you want, I can teach you something. But I have a request...
};


instance DIA_Babo_Anliegen (C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent = FALSE;
	description = " What's the request? " ;
};


func int DIA_Babo_Anliegen_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other,self, " DIA_Babo_Anliegen_15_00 " );	// What's the request?
	AI_Output(self,other, " DIA_Babo_Anliegen_03_01 " );	// Well, one of the paladins, Sergio, lives in a monastery now.
	AI_Output(self,other, " DIA_Babo_Anliegen_03_02 " );	// If you can convince him to give me some lessons, then I'll train you.
	AI_Output(other,self, " DIA_Babo_Anliegen_15_03 " );	// I'll see what I can do.
	Log_CreateTopic(Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboTrain,LOG_Running);
	B_LogEntry(Topic_BaboTrain, " If I can convince paladin Sergio to train with Babo a little, he'll teach me the art of two-handed weapons. " );
};


instances of DIA_Babo_Sergio (C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent = FALSE;
	description = " I talked to Sergio. " ;
};


func int DIA_Babo_Sergio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_Babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other,self, " DIA_Babo_Sergio_15_00 " );	// I talked to Sergio. He will train you for two hours every morning, from five o'clock.
	AI_Output(self,other, " DIA_Babo_Sergio_03_01 " );	// Thank you! What an honor for me!
	AI_Output(self,other, " DIA_Babo_Sergio_03_02 " );	// If you want, I can also show you some martial art secrets.
	Babo_TeachPlayer = TRUE;
	Babo_Training = TRUE;
	B_GivePlayerXP(XP_Ambient * 2);
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	Npc_ExchangeRoutine(Babo,"Train");
	B_LogEntry(Topic_KlosterTeacher, " Babo can teach me how to use two-handed weapons. " );
};


instance DIA_Babo_Teach(C_Info)
{
	npc = NOV_612_Babo;
	nr = 100;
	condition = DIA_Babo_Teach_Condition;
	information = DIA_Babo_Teach_Info;
	permanent = TRUE;
	description = " I'm ready to learn. " ;
};


var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;

func int DIA_Babo_Teach_Condition()
{
	if(((Babo_TeachPlayer == TRUE) && (DIA_Babo_Teach_permanent == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void DIA_Babo_Teach_Info()
{
	babo_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self, " DIA_Babo_Teach_15_00 " );	// I'm ready to learn.
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other, " DIA_DIA_Babo_Teach_Back_03_00 " );	// You know more about two-handed weapons than I could teach you.
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,75);
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_03_00 " );	// Fight for Innos. Innos is our life, and your faith will give you strength.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_03_01 " );	// Servant of Innos never provokes the enemy - he surprises him!
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_03_02 " );	// Wherever you go, always take your staff with you.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_03_03 " );	// Servant of Innos is always ready for battle. If you don't have any magic, your staff is your most important piece of defense.
		};
		Babo_Labercount = Babo_Labercount +  1 ;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0 ;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,75);
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_2H_5_03_00 " );	// A servant of Innos fights not only with his staff, but also with his heart.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_2H_5_03_01 " );	// You need to understand how far you can retreat.
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_2H_5_03_02 " );	// Remember, you fight well when you control your opponent and don't give them a chance to control you.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other, " DIA_DIA_Babo_Teach_2H_5_03_03 " );	// When you drop a fight, you only lose.
		};
		Babo_Labercount = Babo_Labercount +  1 ;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0 ;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

instance DIA_Babo_Wurst (C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Wurst_Condition;
	information = DIA_Babo_Sausage_Info;
	permanent = FALSE;
	description = " Here, have a sausage. " ;
};

func int DIA_Babo_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Babo_Wurst_15_00 " );	// Here, have a sausage.
	AI_Output(self,other, " DIA_Babo_Wurst_03_01 " );	// Oh, lamb sausage, excellent! What an amazing taste - give me another sausage!
	AI_Output(other,self, " DIA_Babo_Wurst_15_02 " );	// Then I won't have enough sausage for the others.
	AI_Output(self,other, " DIA_Babo_Wurst_03_03 " );	// You still have one more sausage than you need. Well, the one meant for you. We're friends. What are we going to share some sausage?
	AI_Output(self,other, " DIA_Babo_Wurst_03_04 " );	// Come on, I'll give you a scroll of 'Fire Arrow' for her.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	Info_ClearChoices(DIA_Babo_Wurst);
	Info_AddChoice(DIA_Babo_Wurst, " Okay, have another sausage. " ,DIA_Babo_Wurst_JA);
	Info_AddChoice(DIA_Babo_Wurst, " No, I won't. " ,DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Sausage_JA()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Babo_Wurst_JA_15_00 " );	// Okay, have another sausage.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	AI_Output(self,other, " DIA_Babo_Wurst_JA_03_01 " );	// Great! Here is your scroll.
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other,self, " DIA_Babo_Wurst_NEIN_15_00 " );	// No, I won't.
	AI_Output(self,other, " DIA_Babo_Wurst_NEIN_03_01 " );	// Look, are you one of those people who are very picky about everything, huh?
	Info_ClearChoices(DIA_Babo_Wurst);
};


instance DIA_Babo_YouAndAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent = FALSE;
	description = " What happened between you and Agon? " ;
};


func int DIA_Babo_YouAndAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other,self, " DIA_Babo_YouAndAgon_15_00 " );	// What happened between you and Agon?
	AI_Output(self,other, " DIA_Babo_YouAndAgon_03_01 " );	// Oh, we had an argument about how to care for fire nettles.
	AI_Output(self,other, " DIA_Babo_YouAndAgon_03_02 " );	// Agon watered it so that the roots of the poor plant almost completely rotted.
	AI_Output(self,other, " DIA_Babo_YouAndAgon_03_03 " );	// And when they rotted completely, he blamed me for it.
	AI_Output(self,other, " DIA_Babo_YouAndAgon_03_04 " );	// Now I'm constantly forced to sweep the yard as punishment.
};


instance DIA_Babo_WhyDidAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 4;
	condition = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent = FALSE;
	description = " Why did Agon do this? " ;
};


func int DIA_Babo_WhyDidAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other,self, " DIA_Babo_WhyDidAgon_15_00 " );	// Why did Agon do this?
	AI_Output(self,other, " DIA_Babo_WhyDidAgon_03_01 " );	// You'd better ask him about it yourself. I think he just can't stand it when someone is better than him.
};


instances of DIA_Babo_PlantLore (C_Info)
{
	npc = NOV_612_Babo;
	nr = 5;
	condition = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent = FALSE;
	description = " You sound like you're good with plants? " ;
};


func int DIA_Babo_PlantLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other,self, " DIA_Babo_PlantLore_15_00 " );	// Sounds like you're good with plants?
	AI_Output(self,other, " DIA_Babo_PlantLore_03_01 " );	// We had a plot in the family where we grew various herbs, and I learned something from my grandfather.
	AI_Output(self,other, " DIA_Babo_PlantLore_03_02 " );	// I would love to work in the garden again.
	MIS_HelpBabo = LOG_Running;
	Log_CreateTopic(Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner,LOG_Running);
	B_LogEntry(Topic_BaboGaertner, " Babo would rather weed grass than sweep the yard. " );
};


instance DIA_Babo_Fegen (C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent = FALSE;
	description = " I have to sweep the novices' cells. " ;
};


func int DIA_Babo_Fegen_Condition()
{
	if(MIS_ParlanFegen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other,self, " DIA_Babo_Fegen_15_00 " );	// I have to sweep the cells of novices.
	AI_Output(self,other, " DIA_Babo_Fegen_03_01 " );	// You've taken on too much work. You know what, I'll help you. There's no way you can do it alone.
	AI_Output(self,other, " DIA_Babo_Fegen_03_02 " );	// But I really need a scroll with the spell 'Wind Fist'. You know, I was lucky and I was allowed to read a book about him.
	AI_Output(self,other, " DIA_Babo_Fegen_03_03 " );	// And now, of course, I want to test this spell. So if you bring me this scroll, I will help you.
	B_LogEntry(Topic_ParlanFegen, " Babo will help me sweep the acolytes' cells if I bring him the Wind Fist scroll. " );
	Wld_InsertItem(ItSc_Windfist,"NW_PATH_TO_MONASTER_AREA_07");
};


instance DIA_Babo_Windfaust (C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent = TRUE;
	description = " About the spell scroll... " ;
};


var int DIA_Babo_Windfaust_permanent;

func int DIA_Babo_Windfaust_Condition()
{
	if ((MIS_LanguageFace == LOG_Running) && Npc_KnowsInfo(other,DIA_Babo_Face) && (DIA_Babo_Windfaucet_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other,self, " DIA_Babo_Windfaust_15_00 " );	// About the scroll...
	AI_Output(self,other, " DIA_Babo_Windfaust_03_01 " );	// Do you have the Windfist scroll for me?
	if(B_GiveInvItems(other,self,ItSc_Windfist,1))
	{
		AI_Output(other,self, " DIA_Babo_Windfaust_15_02 " );	// Here's the scroll you wanted.
		AI_Output(self,other, " DIA_Babo_Windfaust_03_03 " );	// Great. Then I'll help you sweep the cells.
		NOV_Helpers = NOV_Helpers +  1 ;
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		B_LogEntry(Topic_ParlanFegen, " Babo will help me sweep the novices' cells. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Babo_Windfaust_15_04 " );	// No, not yet.
		AI_Output(self,other, " DIA_Babo_Windfaust_03_05 " );	// Nothing, I'll wait.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Life(C_Info)
{
	npc = NOV_612_Babo;
	nr = 10;
	condition = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent = TRUE;
	description = " How is life in the monastery? " ;
};


func int DIA_Babo_Life_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other,self, " DIA_Babo_Life_15_00 " );	// How is life in the monastery?
	AI_Output(self,other, " DIA_Babo_Life_03_01 " );	// I don't want to complain, but I never thought there were such hard and fast rules. If you don't break the rules, you get punished.
	AI_Output(self,other, " DIA_Babo_Life_03_02 " );	// Of course, many acolytes want to study the teachings of Innos in the library in order to prepare to be chosen.
	AI_Output(self,other, " DIA_Babo_Life_03_03 " );	// But I think the best preparation for the trial of magic is to do our job carefully.
	if ( Npc_KnowsInfo ( other , DIA_Iguaranz_Choose ) ==  FALSE )
	{
		AI_Output(other,self, " DIA_Babo_Life_15_04 " );	// What did you say about the chosen ones, and what kind of test?
		AI_Output(self,other, " DIA_Babo_Life_03_05 " );	// Talk to brother Igaraz. He knows more about it.
	};
};


instances of DIA_Babo_HowIsIt (C_Info)
{
	npc = NOV_612_Babo;
	nr = 1;
	condition = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Babo_HowIsIt_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (Chapter <  3 ))
	{
		return TRUE;
	};
};


var int Babo_XPgiven;

func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other,self, " DIA_Babo_HowIsIt_15_00 " );	// How are you?
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Babo_HowIsIt_03_01 " );	// I thank the mages for giving me orders.
		AI_Output(self,other, " DIA_Babo_HowIsIt_03_02 " );	// I enjoy gardening, and I hope the mages are pleased with me, Master.
		if (Babo_XPgiven ==  FALSE )
		{
			B_GivePlayerXP(XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Babo_HowIsIt_03_03 " );	// H... h... well, Master.
		AI_Output(self,other, " DIA_Babo_HowIsIt_03_04 " );	// I, I work hard and try not to disappoint mages.
	};
	AI_StopProcessInfos(self);
};


var int babomageplantday;

instances DIA_BABO_KDF_HAVEDOCS (C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = dia_babo_kdf_havedocs_condition;
	information = dia_babo_kdf_havedocs_info;
	permanent = FALSE;
	description = " Won't you tell me what these documents are? " ;
};


func int dia_babo_kdf_havedocs_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_NOV)) && ((Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >= 1) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >= 1))))
	{
		return TRUE;
	};
};

func void dia_babo_kdf_havedocs_info()
{
	AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_00 " );	// Can you tell me what these documents are?
	AI_Output(self,other, " DIA_Babo_KDF_HaveDocs_03_01 " );	// (frightened) I... I...
	AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_02 " );	// Calm down.

	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_03 " );	// Acolytes must help each other.
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_04 " );	// Take the letter, it's addressed to you. And I'll post the picture.
		AI_Output(self,other, " DIA_Babo_KDF_HaveDocs_03_05 " );	// You won't say anything to the mages?
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_06 " );	// No, of course not, calm down.
	}
	else
	{
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_07 " );	// I won't tell Master Parlan about this.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_08");	//Ооох...
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_09 " );	// But you will fulfill your vow of obedience. Harvest ten fire nettle plants in two days.
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_10 " );	// And immediately destroy the letter that is addressed to you. Here it is.
		AI_Output(other,self, " DIA_Babo_KDF_HaveDocs_15_11 " );	// And I'll destroy the picture myself.
		AI_Output(self,other, " DIA_Babo_KDF_HaveDocs_03_12 " );	// Thank you, master. I will definitely keep my promise.
		BABOMAGEPLANTDAY = Wld_GetDay() + 2;
	};
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		Npc_RemoveInvItems(other,ItWr_BabosDocs_MIS,1);
		CreateInvItems(other,ItWr_BabosPinUp_MIS,1);
		CreateInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_GiveInvItems(other,self,ItWr_BabosLetter_MIS,1);
	Npc_RemoveInvItems(self,ItWr_BabosLetter_MIS,1);
	B_GivePlayerXP(XP_BabosDocs);
};


instance DIA_BABO_KDF_PLANTS(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = dia_babo_kdf_plants_condition;
	information = dia_babo_kdf_plants_info;
	permanent = FALSE;
	description = " Did you fulfill your vow? " ;
};


func int dia_babo_kdf_plants_condition()
{
	if((other.guild == GIL_KDF) && (BABOMAGEPLANTDAY <= Wld_GetDay()) && (BABOMAGEPLANTDAY != 0))
	{
		return TRUE;
	};
};

func void dia_babo_kdf_plants_info()
{
	AI_Output(other,self, " DIA_Babo_KDF_Plants_15_00 " );	// Did you fulfill your vow?
	AI_Output(self,other, " DIA_Babo_KDF_Plants_03_01 " );	// Sure, master.
	CreateInvItems(self,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(dia_babo_kdf_plants);
	Info_AddChoice(dia_babo_kdf_plants, " Я заберу их " ,dia_babo_kdf_plants_takeall);
	Info_AddChoice(dia_babo_kdf_plants, " Keep five plants for yourself... " ,dia_babo_kdf_plants_takehalf);
};

func void dia_babo_kdf_plants_takehalf()
{
	AI_Output(other,self, " DIA_Babo_KDF_Plants_15_02 " );	// Keep the five plants for yourself and go to Master Neoras to practice alchemy.
	AI_Output(self,other, " DIA_Babo_KDF_Plants_03_02 " );	// Thank you, master.
	B_GivePlayerXP(XP_Ambient * 2);
	Npc_ExchangeRoutine(self,"ALCHEMY");
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,5);
	Info_ClearChoices(dia_babo_kdf_plants);
};

func void dia_babo_kdf_plants_takeall()
{
	AI_Output(other,self, " DIA_Babo_KDF_Plants_15_02 " );	// Keep the five plants for yourself and go to Master Neoras to practice alchemy.
	AI_Output(self,other, " DIA_Babo_KDF_Plants_03_03 " );	// Thank you, master.
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(dia_babo_kdf_plants);
};


instance DIA_Babo_Kap2_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Babo_Kap3_Hello_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Hello_15_00 " );	// What are you doing here?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Babo_Kap3_Hello_03_01 " );	// I'm trying to complete the tasks given to me so that the mages of the monastery are satisfied.
	}
	else
	{
		AI_Output(self,other, " DIA_Babo_Kap3_Hello_03_02 " );	// I shouldn't talk to you. It wouldn't do me any good if they noticed me talking to a stranger.
	};
};


instance DIA_Babo_Kap3_KeepTheFaith(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent = FALSE;
	description = " You mustn't lose faith. " ;
};


func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if ((Chapter >=  3 ) && Npc_KnowsInfo(other, DIA_Babo_Chapter3_Hello) && (hero.guild ==  GIL_KDF )) ;
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other,self, " DIA_Babo_Kap3_KeepTheFaith_15_00 " );	// You mustn't lose faith.
	AI_Output(self,other, " DIA_Babo_Kap3_KeepTheFaith_03_01 " );	// No... I mean, it won't happen again. I swear!
	AI_Output(other,self, " DIA_Babo_Kap3_KeepTheFaith_15_02 " );	// We all go through severe trials.
	AI_Output(self,other, " DIA_Babo_Kap3_KeepTheFaith_03_03 " );	// Yes, Master. I will always remember this. Thank you.
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Babo_Kap3_Unhappy(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent = FALSE;
	description = " You don't look particularly cheerful. " ;
};

func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if ((Capital >  2 ) && Npc_KnowsInfo(other, DIA_Babo_Cap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_15_00 " );	// You don't look particularly cheerful.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_03_01 " );	// Uh...(caught off guard) I mean, I'm fine, really.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_03_02 " );	// Just... Oh, I don't want to complain.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " Then stop whining. " ,DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " Come on, you can tell me. " ,DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Lament_15_00 " );	// Then stop whining.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Lament_03_01 " );	// I... (frightened) I... please don't tell the mages.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Lament_03_02 " );	// I don't want to be punished again.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Lament_15_03 " );	// I'll think about it.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_TellMe_15_00 " );	// Come on, you can tell me.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_TellMe_03_01 " );	// You really won't tell the magicians?
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_TellMe_15_02 " );	// Do I look like someone who immediately runs to report?
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_TellMe_03_03 " );	// Well, okay. I have a problem with one of the acolytes. He is blackmailing me.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_TellMe_15_04 " );	// Come on, lay it out.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_TellMe_03_05 " );	// Igarats, that's the name of this acolyte, found my personal notes.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_TellMe_03_06 " );	// He threatens to hand them over to mages if I don't do what he says.
	MIS_BabosDocs = LOG_Running;
	Log_CreateTopic(Topic_BabosDocs,LOG_MISSION);
	Log_SetTopicStatus(Topic_BabosDocs,LOG_Running);
	B_LogEntry(Topic_BabosDocs, " Igaraz is blackmailing Babo's acolyte with some documents. " );
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " I don't think I should get into this mess. " ,DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " What should you do for him? " ,DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " What were those entries? " ,DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " Maybe I can help you? " ,DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Private()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Privat_15_00 " );	// I think I shouldn't get into this mess.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Privat_03_01 " );	// I understand you don't want problems. I'll figure it out myself somehow.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Privat_15_02 " );	// I believe you can do it.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_ShouldDo_15_00 " );	// What should you do for him?
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_ShouldDo_03_01 " );	// I'm so ashamed to speak. This will not please Innos.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_ShouldDo_03_02 " );	// I don't even want to think about what will happen if everything is revealed.
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Documents_15_00 " );	// What were those entries?
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Documents_03_01 " );	// (unsure) This is nobody's business. This is my own business.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Documents_15_02 " );	// Come on, talk.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Documents_03_03 " );	// They are... these are... perfectly normal records. Nothing special.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Documents_15_04 " );	// I won't ask again.
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00 " );	// Maybe I can help you?
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01 " );	// Will you do it?
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02 " );	// Well... maybe... it depends...
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03 " );	// (hurriedly) Of course I'll pay you for it.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04 " );	// How much?
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05 " );	// Well, I don't have much money, but I could give you a spell scroll. I have a healing spell.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " I'd rather not mess with this. " ,DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, " Я попробую. " ,DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_No_15_00 " );	// I'd rather not mess with this.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_No_03_01 " );	// Then I have no choice, I'll have to extricate myself.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Yes_15_00 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Yes_03_01 " );	// Really?! I know you can do it. I believe!
	AI_Output(self,other, " DIA_Babo_Kap3_Unhappy_Yes_03_02 " );	// You just need to find out where Igaraz keeps his stuff. Then you steal them from him and everything will be all right.
	AI_Output(other,self, " DIA_Babo_Kap3_Unhappy_Yes_15_03 " );	// Relax. Keep working. And I'll take care of the rest.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

instance DIA_Babo_Kap3_HaveYourDocs(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent = FALSE;
	description = " I found your notes. " ;
};


func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if (((MIS_BabosDocs == LOG_Running) && (Npc_HasItems(other,ItWr_BabosDocs_MIS) >=  1 )) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >=  1 ) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_15_00 " );	// I found your notes.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_03_01 " );	// True? Thanks, you saved me. I don't even know how to thank you.
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_15_02 " );	// Yeah, yeah, just calm down.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_03_03 " );	// Are these really mine?...(nervously) Are you sure?! Show me.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, " I'll keep them for now. " ,DIA_Babo_Kap3_HaveYourDocs_KeepThem);

	if(BabosDocsOpen == TRUE)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, " All things considered, the price has gone up now. " ,DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};

	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, " Вот, джи. " ,DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00 " );	// I'll keep them for now.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01 " );	// What?! What does it all mean? What did you think?
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Просто шучу.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Это мое дело!",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Просто шучу.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01 " );	// Ha-ha, but something is not funny to me. Where are they?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Здесь.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03 " );	// I didn't mean to offend you, but I'm just really worried.
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04 " );	// All is well. Enjoy your notes.
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs, " I gave Babo his documents. " );
	B_GivePlayerXP(XP_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00 " );	// This is my business.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01 " );	// These posts belong to me! You have no right to take them for yourself.
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00 " );	// Hold your tongue!
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01 " );	// I understand everything, but trust me, you will regret it.
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02 " );	// See you later.
	MIS_BabosDocs = LOG_FAILED;
	B_LogEntry_Failed(Topic_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00 " );	// Now, all things considered, the price has gone up.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01 " );	// You're no better than the rest. What do you want?
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02 " );	// What do you have?
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03 " );	// I can give you a hundred coins - that's all I have.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, " назаднанна! " ,DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Договорились!",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00 " );	// This is not enough.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01 " );	// But I don't have any more money. If I had known about this earlier, my foot would not have been in the monastery.
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	B_GivePlayerXP(XP_BabosDocs);
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00 " );	// Agreed!
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01 " );	// Here's the money.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Вот, держи.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01 " );	// Yes, everything is in place.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Ты читал их?
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03 " );	// Does it matter?
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04 " );	// Not when I have them in my hands.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05 " );	// Now I hope I can sleep peacefully again.
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs, " I gave Babo his documents. " );
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	B_GivePlayerXP(XP_BabosDocs);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Вот, держи.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01 " );	// Yes, everything is in place.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Ты читал их?
	AI_Output(other,self, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03 " );	// Does it matter?
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04 " );	// Not when I have them in my hands.
	AI_Output(self,other, " DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05 " );	// Now I hope I can sleep peacefully again.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs, " I gave Babo his documents. " );
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

instance DIA_Babo_Kap3_Perm(C_Info)
{
	npc = NOV_612_Babo;
	nr = 39;
	condition = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent = TRUE;
	description = " Are you satisfied with your work? " ;
};

func int DIA_Babo_Kap3_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other,self, " DIA_Babo_Kap3_Perm_15_00 " );	// Are you satisfied with your work?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Babo_Kap3_Perm_03_01 " );	// (unconvincingly) Yes, of course. My faith in the wisdom and strength of Innos gives me strength.
		AI_Output(self,other, " DIA_Babo_Kap3_Perm_03_02 " );	// (evasively) I don't mean to be impolite, but I have a lot to do today.
		AI_Output(other,self, " DIA_Babo_Kap3_Perm_15_03 " );	// You can continue.
		AI_Output(self,other, " DIA_Babo_Kap3_Perm_03_04 " );	// (relieved) Thank you.
	}
	else
	{
		AI_Output(self,other, " DIA_Babo_Kap3_Perm_03_05 " );	// All is well, but I have to get back to work or I'll never finish it today.
		AI_Output(self,other, " DIA_Babo_Kap3_Perm_03_06 " );	// I don't want to work until midnight again to get my job done and not be punished.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap4_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap5_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_PICKPOCKET(C_Info)
{
	npc = NOV_612_Babo;
	nr = 900;
	condition = DIA_Babo_PICKPOCKET_Condition;
	information = DIA_Babo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Babo_PICKPOCKET_Condition()
{
	return  C_Robbery ( 17 , 25 );
};

func void DIA_Babo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
	Info_AddChoice(DIA_Babo_PICKPOCKET,Dialog_Back,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};


instance DIA_BABO_KAP6_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = dia_babo_kap6_exit_condition;
	information = dia_babo_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_babo_kap6_exit_condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void dia_babo_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

