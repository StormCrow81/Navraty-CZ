
instance DIA_Addon_Riordian_EXIT(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 999;
	condition = DIA_Addon_Riordian_EXIT_Condition;
	information = DIA_Addon_Riordian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_Hallo (C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_Hallo_Condition;
	information = DIA_Addon_Riordian_Hallo_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Riordian_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Hallo_15_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_Addon_Riordian_Hallo_10_01 " );	// I study the culture of an ancient people.
	AI_Output(self,other, " DIA_Addon_Riordian_Hallo_10_02 " );	// According to their records, they lived here in the distant past.
	AI_Output(self,other, " DIA_Addon_Riordian_Hallo_10_03 " );	// I don't know exactly when they built these halls, but already at that time their civilization was quite highly developed.
	AI_Output(self,other, " DIA_Addon_Riordian_Hallo_10_04 " );	// On the other side of the mountains they built their city and, apparently, erected a temple to Adanos.
};


instance DIA_Addon_Riordian_Alter(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 6;
	condition = DIA_Addon_Riordian_Alter_Condition;
	information = DIA_Addon_Riordian_Alter_Info;
	description = " How old do you think this building is? " ;
};


func int DIA_Addon_Riordian_Alter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_Alter_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Alter_15_00 " );	// How old do you think this building is?
	AI_Output(self,other, " DIA_Addon_Riordian_Alter_10_01 " );	// Can't say for sure. Several hundred.
};


instance DIA_Addon_Riordian_Atlantis(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 4;
	condition = DIA_Addon_Riordian_Atlantis_Condition;
	information = DIA_Addon_Riordian_Atlantis_Info;
	description = " Lost city on Khorinis? " ;
};


func int DIA_Addon_Riordian_Atlantis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_Atlantis_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Atlantis_15_00 " );	// Lost city on Khorinis?
	AI_Output(self,other, " DIA_Addon_Riordian_Atlantis_10_01 " );	// Yes. Until recently, we were sure that we knew everything about the island.
	AI_Output(self,other, " DIA_Addon_Riordian_Atlantis_10_02 " );	// We thought that the entire northeast of the island is one large mountain range.
	AI_Output(self,other, " DIA_Addon_Riordian_Atlantis_10_03 " );	// But we were wrong.
	AI_Output(self,other, " DIA_Addon_Riordian_Atlantis_10_04 " );	// Behind these mountains lies a valley. This is where the ancient city is located.
	AI_Output(self,other, " DIA_Addon_Riordian_Atlantis_10_05 " );	// (sighs) I'd love to see its old buildings, but they've probably crumbled to dust a long time ago...
	B_LogEntry(TOPIC_Addon_KDW, " Waterbenders believe there is an ancient lost city beyond the portal. " );
};


instance DIA_Addon_Riordian_SaturasWantYou(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_SaturasWantYou_Condition;
	information = DIA_Addon_Riordian_SaturasWantYou_Info;
	description = " Saturas wants to see you. " ;
};


func int DIA_Addon_Riordian_SaturasWantYou_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Riordian_Hello ) && ( MY_Addon_Saturation_BringRiordian2Me == LOG_Running )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_SaturasWantYou_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_SaturasWantYou_15_00 " );	// Saturas wants to see you.
	AI_Output(self,other, " DIA_Addon_Riordian_SaturasWantYou_10_01 " );	// Has he made any progress in his research? In that case, I go to him immediately.
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Riordian_SaturasWantYou_10_02 " );	// If you want to learn more about these structures, talk to Nefarious.
		AI_Output(self,other, " DIA_Addon_Riordian_SaturasWantYou_10_03 " );	// You'll find him at the back of the halls.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Сатурас");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS ;
	B_GivePlayerXP(XP_Ambient);
};


var int Riordian_PermNews;

instance DIA_Addon_Riordian_Perm(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 99;
	condition = DIA_Addon_Riordian_Perm_Condition;
	information = DIA_Addon_Riordian_Perm_Info;
	permanent = TRUE;
	description = " Anything new? " ;
};


func int DIA_Addon_Riordian_Perm_Condition()
{
	if (MIS_Addon_Saturas_BringRiordian2Me ==  LOG_SUCCESS )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Riordian_Perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_Perm_15_00 " );	// Anything new?
	if(Riordian_PermNews == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Riordian_Perm_10_01 " );	// Yes! I found confirmation that this ancient civilization actually worshiped Adanos!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Riordian_Perm_10_02 " );	// No, not yet. Come back later.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 1;
	condition = dia_addon_riordian_prayforgomez_condition;
	information = dia_addon_riordian_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_riordian_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Riordian_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Riordian_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};

instance DIA_ADDON_RIORDIAN_TEACHPRE(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = " Vatras gave me this Seeking Wisp Amulet... " ;
};

func int dia_addon_riordian_teachpre_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Riordian_Hello ) && Npc_HasItems ( other , ItAm_WispDetector_Addon ) ) ;
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teachpre_info()
{
	AI_Output(other,self, " DIA_Addon_Riordian_TeachPre_15_00 " );	// Vatras gave me this amulet of the Seeking Wisp...
	AI_Output(self,other, " DIA_Addon_Riordian_TeachPre_10_01 " );	// Aha! (interested) It's a rare artifact... Do you know that you can train your Wisp?
	AI_Output(other,self, " DIA_Addon_Riordian_TeachPre_15_02 " );	// Can you teach me this?
	AI_Output(self,other, " DIA_Addon_Riordian_TeachPre_10_03 " );	// Yes, of course. I have been involved in this area of ​​magic for a long time.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};

instance DIA_ADDON_RIORDIAN_TEACH(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 90;
	condition = dia_addon_riordian_teach_condition;
	information = dia_addon_riordian_teach_info;
	permanent = TRUE;
	description = " (training the searching wisp) " ;
};

var int dia_addon_riordian_teach_noperm;

func int dia_addon_riordian_teach_condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teach_info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if((player_talent_wispdetector[WISPSKILL_NF] == FALSE) || (player_talent_wispdetector[WISPSKILL_FF] == FALSE) || (player_talent_wispdetector[WISPSKILL_NONE] == FALSE) || (player_talent_wispdetector[WISPSKILL_RUNE] == FALSE) || (player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE) || (player_talent_wispdetector[WISPSKILL_FOOD] == FALSE) || (player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_teach);
		Info_AddChoice(dia_addon_riordian_teach,Dialog_Back,dia_addon_riordian_teach_back);
		B_DIA_Addon_Riordian_Teach_10_01();

		if(player_talent_wispdetector[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach, " Search for Ranged Weapons, Arrows and Bolts (Requires: 10 Magic Ore) " ,dia_addon_riordian_teach_wispskill_ff);
		};
		if(player_talent_wispdetector[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach, " Search for gold and various utensils (Requires: 20 pieces of magic ore) " ,dia_addon_riordian_teach_wispskill_none);
		};
		if(player_talent_wispdetector[WISPSKILL_RUNE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach, " Find Magic Scrolls (Requires: 30 Magic Ore) " ,dia_addon_riordian_teach_wispskill_rune);
		};
		if(player_talent_wispdetector[WISPSKILL_FOOD] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach, " Find Food and Plants (Requires: 50 Magic Ore) " ,dia_addon_riordian_teach_wispskill_food);
		};
		if(player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach, " Search for Magic Rings and Amulets (Requires: 75 Magic Ore) " ,dia_addon_riordian_teach_wispskill_magic);
		};
		if(player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach, " Find Magic Potions (Requires: 100 Magic Ore) " ,dia_addon_riordian_teach_wispskill_potions);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_ADDON_RIORDIAN_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_teach_wispskill_x()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void dia_addon_riordian_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF,10))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE,20))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE,30))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC,75))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD,50))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS,100))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};
