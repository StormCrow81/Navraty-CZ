

instance DIA_TORLOF_LI_KAP3_EXIT(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 999;
	condition = dia_torlof_li_kap3_exit_condition;
	information = dia_torlof_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_torlof_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_torlof_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_LI_TEACH(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 150;
	condition = dia_torlof_li_teach_condition;
	information = dia_torlof_li_teach_info;
	permanent = TRUE;
	description = "Я хочу увеличить свои способности!";
};


func int dia_torlof_li_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_aboutisland) && Npc_KnowsInfo(hero,dia_torlof_li_whereguys) && Npc_KnowsInfo(hero,dia_torlof_li_island))
	{
		return TRUE;
	};
};

func void dia_torlof_li_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//Я хочу улучшить свои способности!
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_back()
{
	Info_ClearChoices(dia_torlof_li_teach);
};

func void dia_torlof_li_teach_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_str_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_str_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};


instance DIA_TORLOF_LI_PICKPOCKET(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 900;
	condition = dia_torlof_li_pickpocket_condition;
	information = dia_torlof_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_torlof_li_pickpocket_condition()
{
	return  C_Robbery ( 76 , 120 );
};

func void dia_torlof_li_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_li_pickpocket);
	Info_AddChoice(dia_torlof_li_pickpocket,Dialog_Back,dia_torlof_li_pickpocket_back);
	Info_AddChoice(dia_torlof_li_pickpocket,DIALOG_PICKPOCKET,dia_torlof_li_pickpocket_doit);
};

func void dia_torlof_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_torlof_li_pickpocket);
};

func void dia_torlof_li_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_li_pickpocket);
};


instance DIA_TORLOF_LI_STORM(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_storm_condition;
	information = dia_torlof_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_li_storm_condition()
{
	return TRUE;
};

func void dia_torlof_li_storm_info()
{
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_01 " );	// You've finally come to your senses! How are you feeling?
	AI_Output(other,self, " DIA_Torlof_LI_Storm_01_02 " );	// Head splits as if hit with something heavy.
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_03 " );	// Yeah, buddy... (laughs) You've had enough!
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_08 " );	// During a storm, one of the waves hit our ship with such force that it knocked you off your feet and threw you onto a false cot!
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_09 " );	// You must have hit your head really hard on him, because you immediately lost consciousness.
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_13 " );	// Damn! (besides himself) Yes, this storm almost sent us all to the next world!
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_15 " );	// Thank Innos that we stumbled upon this island!
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_21 " );	// In this bay, you can feel completely safe.
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_23 " );	// But it's too early to rejoice. Now we need to think about how to fix our ship.
	AI_Output(other,self, " DIA_Torlof_LI_Storm_01_24 " );	// Does it need repair?
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_25 " );	// Still. The storm had beaten him up.
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_26 " );	// Patch a couple of holes, of course, not a problem, but we have a broken steering wheel. Without it, we won't get far!
	AI_Output(other,self, " DIA_Torlof_LI_Storm_01_27 " );	// How long will it take?
	AI_Output(self,other, " DIA_Torlof_LI_Storm_01_28 " );	// I don't know. Maybe a couple of days, maybe a week. I can not say exactly.
};


instance DIA_TORLOF_LI_REPAIR(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_repair_condition;
	information = dia_torlof_li_repair_info;
	permanent = FALSE;
	description = " Is there anything I can help you do with the repair? " ;
};


func int dia_torlof_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm))
	{
		return TRUE;
	};
};

func void dia_torlof_li_repair_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_Repair_01_01 " );	// Can I help you with the repair?
	AI_Output(self,other, " DIA_Torlof_LI_Repair_01_02 " );	// You?! Hmmm... (thinking) I don't even know.
	AI_Output(self,other, " DIA_Torlof_LI_Repair_01_03 " );	// I need to get a better look at the damage first and then figure out how to fix it.
	AI_Output(self,other, " DIA_Torlof_LI_Repair_01_04 " );	// So I don't think I'll need your help right now. If only later...
	AI_Output(other,self,"DIA_Torlof_LI_Repair_01_05");	//Ясно.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry( TOPIC_REPAIRSHIP , " I offered to help Torlof with the repair of our ship. He replied that he needed to inspect all the damage first and decide how to fix it. So for now, Torlof does not need my help. We should ask him about it a little later. " );
};


instance DIA_TORLOF_LI_REPAIRHELP(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_repairhelp_condition;
	information = dia_torlof_li_repairhelp_info;
	permanent = FALSE;
	description = " How is the repair going on the ship? " ;
};


func int dia_torlof_li_repairhelp_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_repairhelp_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelp_01_01 " );	// How is the ship's repair progressing?
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_02 " );	// Good thing you asked! Looks like I still need your help.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_05 " );	// Over the past few days, I've examined all the damage on the ship and come to the conclusion that most of them are quite minor.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_06 " );	// I can handle them myself. But we also have one serious problem - this is our steering wheel!
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_08 " );	// It doesn't work at all! Looks like it got ripped off completely, and now it's a completely useless thing.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_09 " );	// And without it, as you yourself understand, the ship is absolutely uncontrollable!
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelp_01_10 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_11 " );	// I think that the whole problem is in one of the gears.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_12 " );	// Apparently, during the storm, her teeth were torn off, and for this reason our steering wheel lost control.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_13 " );	// So if we can find a replacement for her, we'll probably solve this problem.
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelp_01_14 " );	// But where do we get the new gear?
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_15 " );	// That's exactly what I wanted to ask you to do. Maybe you will be lucky and you will be able to find some suitable little thing for this business.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelp_01_17 " );	// We have no other choice... (sadly) Otherwise, we'll be stuck here for a long time!
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelp_01_18 " );	// I'll see what I can do.
	B_LogEntry( TOPIC_REPAIRSHIP , " Torlof asked me to help him with the steering wheel, which was broken during the storm. One of the gears on the steering wheel was torn off, and now the ship is completely uncontrollable. We need to look for a replacement for this part - something that could serve as gears. " );
};


instance DIA_TORLOF_LI_REPAIRHELPDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_repairhelpdone_condition;
	information = dia_torlof_li_repairhelpdone_info;
	permanent = FALSE;
	description = " I found something here. " ;
};


func int dia_torlof_li_repairhelpdone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_torlof_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_01 " );	// I found something here.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_02 " );	// What exactly?
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_03 " );	// Here, take a look.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_04 " );	// What an interesting thing! Where did you dig it up?
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_05 " );	// In a small pyramid located on an island.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_06 " );	// Not bad at all! I see you didn't waste any time.
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_07 " );	// Will it work as a gear?
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_08 " );	// (thoughtfully) Let's see.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_10 " );	// Looks like it really fits!
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_12 " );	// (seriously) Wait a second...
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_14 " );	// Everything seems to be ok.
	AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_15 " );	// Now we can get off this island!
	AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_16 " );	// When do we sail?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry( TOPIC_REPAIRSHIP , " I brought Torlof the cog-shaped piece of stone I found. And much to his surprise, this thing fit perfectly as a gear for our steering wheel. " );
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_17 " );	// Yes, right now!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_18 " );	// Only first we need to inform the guys on the shore that we are weighing anchor.
			AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_20 " );	// Okay, I'll pass it on to them.
			CANWAYFROMLI = TRUE ;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry( TOPIC_GATHERCREW , " Torlof asked me to tell all the guys on the beach that we are weighing anchor. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_21 " );	// So just say it and we'll set sail in no time.
			AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_22");	//Хорошо.
			CANWAYFROMLI = TRUE ;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_23 " );	// Not so fast, mate! The ship is not yet ready to sail.
		AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_24 " );	// I haven't had time to fix some other minor damage yet!
		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_25 " );	// Moreover, we still don't know where we are!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_26 " );	// Moreover, we still haven't decided where to go.
		};
		AI_Output(self,other, " DIA_Torlof_LI_RepairHelpDone_01_27 " );	// So let's not rush.
		AI_Output(other,self, " DIA_Torlof_LI_RepairHelpDone_01_28 " );	// Okay, then you'll say it yourself.
		AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_29");	//Конечно.
	};
};


instance DIA_TORLOF_LI_AWAY(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_away_condition;
	information = dia_torlof_li_away_info;
	permanent = TRUE;
	description = " When are we leaving? " ;
};


func int dia_torlof_li_away_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( MIS_REPAIRSHIP  ==  LOG_SUCCESS ) && ( CANAWAYFROMLI  ==  FALSE ) && ( TORLOFLITIMERAWAY  <= ( daynow -  1 )))
	{
		return TRUE;
	};
};

func void dia_torlof_li_away_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_Away_01_00 " );	// When do we sail?

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_01 " );	// Yes, right now!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other, " DIA_Torlof_LI_Away_01_02 " );	// Only first we need to inform the guys on the shore that we are weighing anchor.
			AI_Output(other,self, " DIA_Torlof_LI_Away_01_04 " );	// Okay, I'll pass it on to them.
			CANWAYFROMLI = TRUE ;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry( TOPIC_GATHERCREW , " Torlof asked me to tell all the guys on the beach that we are weighing anchor. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Torlof_LI_Away_01_05 " );	// So just say it and we'll set sail in no time.
			AI_Output(other,self,"DIA_Torlof_LI_Away_01_06");	//Хорошо.
			CANWAYFROMLI = TRUE ;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else  if ( MIS_LOST_ISLAND  == LOG_Running )
	{
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_07 " );	// But we still don't know where we are!
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_08 " );	// So it's too early to think about it.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_10 " );	// But we still haven't decided where to go!
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_11 " );	// So it's too early to think about it.
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_13 " );	// It's too soon to think about it until I've finished repairing the ship.
		AI_Output(self,other, " DIA_Torlof_LI_Away_01_14 " );	// So it's better to do something useful for now.
	};
};


instance DIA_TORLOF_LI_AWAYDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_awaydone_condition;
	information = dia_torlof_li_awaydone_info;
	permanent = TRUE;
	description = " Time to go. " ;
};


func int dia_torlof_li_awaydone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if (( CANAWAYFROMLI  ==  TRUE ) && ( NORTH CAPTAINLIAWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_torlof_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self, " DIA_Torlof_LI_AwayDone_01_00 " );	// Time to go.

	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_01 " );	// Good! We weigh anchor.
		AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_02 " );	// In the meantime, you can go and relax in your cabin.
		CAPITANORDERLIAWAY = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIONBOARD == TRUE) && (GORNLIHERE == TRUE) && (GORNLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_fighter_li,"RunAway");
			AI_Teleport(pc_fighter_li,"SHIP_DECK_03");
			GORNLIHEREDONE = TRUE;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE) && (MILTENLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_mage_li,"RunAway");
			AI_Teleport(pc_mage_li,"SHIP_CREW_19");
			MILTENLIHEREDONE = TRUE ;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE) && (LESTERLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_psionic_li,"RunAway");
			AI_Teleport(pc_psionic_li,"SHIP_DECK_28");
			LESTERLIHEREDONE = TRUE;
		};
		if (( Diego_IsOnBoard ==  LOG_SUCCESS ) && ( Npc_IsDead ( pc_thief_li ) ==  FALSE ) && ( DIEGOLIONBOARD  ==  TRUE ) && ( DIEGOLIHERE  ==  TRUE ) && ( DIEGOLIHEREDONE  ==  FALSE ))
		{
			Npc_ExchangeRoutine(pc_thief_li,"RunAway");
			AI_Teleport(pc_thief_li,"SHIP_CREW_04");
			DIEGOLIHEREDONE = TRUE;
		};
		if ((Angar_IsOnBoard ==  LOG_SUCCESS ) && (Npc_IsDead(djg_705_angar_li) ==  FALSE ) && ( ANGARLIONBOARD  ==  TRUE ) && ( ANGARLIHERE  ==  TRUE ) && ( ANGARLIHEREDONE  ==  FALSE )) ;
		{
			Npc_ExchangeRoutine(djg_705_angar_li,"RunAway");
			AI_Teleport(djg_705_angar_li,"SHIP_CREW_03");
			ANGARLIHEREDONE = TRUE;
		};
		if(LICREWONBOARD == TRUE)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_06 " );	// Good! It seems that all the guys are on the ship, which means that you can weigh anchor.
			AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_07 " );	// In the meantime, you can go and relax in your cabin.
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry( TOPIC_GATHERCREW , " All the crew is on the ship, and now we can go! " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_11 " );	// But not all the guys have returned from the shore yet! We can't leave them!
			AI_Output(other,self, " DIA_Torlof_LI_AwayDone_01_12 " );	// Who's missing?
			AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_13 " );	// (looking around) Hmmm, I don't think so...
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_14");	//...Горна
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_15");	//...Милтена
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_16");	//...Лестера
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_17");	//...Диего
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_18");	//...Кор Ангара
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other, " DIA_Torlof_LI_AwayDone_01_19 " );	// The rest of the guys seem to be in place.
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self, " DIA_Torlof_LI_AwayDone_01_20 " );	// I'll tell them to get back to the ship.
			}
			else
			{
				AI_Output(other,self, " DIA_Torlof_LI_AwayDone_01_21 " );	// I'll tell him to get back to the ship.
			};
		};
	};
};


instance DIA_TORLOF_LI_ISLAND(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_island_condition;
	information = dia_torlof_li_island_info;
	permanent = FALSE;
	description = " Where are we and what is this island? " ;
};


func int dia_torlof_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm))
	{
		return TRUE;
	};
};

func void dia_torlof_li_island_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_Island_01_01 " );	// Where are we and what is this island?
	AI_Output(self,other, " DIA_Torlof_LI_Island_01_02 " );	// I, like you, see this island for the first time in my life!
	AI_Output(self,other, " DIA_Torlof_LI_Island_01_03 " );	// And I have absolutely no idea where we are right now.
	AI_Output(self,other, " DIA_Torlof_LI_Island_01_05 " );	// Only Innos knows where we've gone.
	AI_Output(other,self, " DIA_Torlof_LI_Island_01_07 " );	// And what are we going to do?
	AI_Output(self,other, " DIA_Torlof_LI_Island_01_13 " );	// If we can at least roughly understand in which part of the ocean we ended up, then we can return to our previous course.
	AI_Output(self,other, " DIA_Torlof_LI_Island_01_15 " );	// It might be worth taking a walk around the island itself.
	AI_Output(self,other, " DIA_Torlof_LI_Island_01_16 " );	// I think if we look for answers to all our questions, then only there.
	MY_LOST ISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry( TOPIC_LOSTISLAND , " It looks like we're completely lost. Our captain has absolutely no idea what kind of island this is and where we ended up at all! So the only thing left for us is to try to sort things out and find out for ourselves somehow where we are now. " );
	Log_AddEntry( TOPIC_LOSTISLAND , " After talking with Torlof about this, we both agreed that the first thing to do would be to just visit this mysterious island and inspect it as carefully as possible. Perhaps something can be found there. " );
};


instance DIA_TORLOF_LI_ISLANDPROGRESS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_islandprogress_condition;
	information = dia_torlof_li_islandprogress_info;
	permanent = FALSE;
	description = " Look, I found this tile. " ;
};


func int dia_torlof_li_islandprogress_condition()
{
	if (( MY_LOST_COUNTRY  == LOG_Running ) && ( Npc_HasItems ( hero , itwr_lost_countrymap ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_torlof_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Torlof_LI_IslandProgress_01_00 " );	// Look, I found this tile.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_01 " );	// Hmmm... (surprised) What an interesting thing!
	AI_Output(other,self, " DIA_Torlof_LI_IslandProgress_01_03 " );	// It has some weird symbols on it.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_05 " );	// (with interest) Let me see.
	AI_Output(other,self, " DIA_Torlof_LI_IslandProgress_01_06 " );	// Here, take this.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_07 " );	// Hmmm... (thoughtfully) This is all very strange.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_08 " );	// (hesitantly) Although, if you look closely, it all looks very much like...
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_10 " );	// Not exactly sure, but this stone tile looks a bit like a map.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgress_01_11");	//Карту?!
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_12 " );	// Yes, a map! That's just what she shows - this I can not say.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_13 " );	// It looks like some numbers are still stamped here. Perhaps they are the key to deciphering what is depicted on the card itself!
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_17 " );	// Perhaps these numbers represent the latitude and longitude of this island.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_18 " );	// If this really turns out to be the case, then we can easily determine where we are now.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_19 " );	// True, for this I would need a sea sextant.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_21 " );	// Without it, I can't do accurate calculations.
	AI_Output(other,self, " DIA_Torlof_LI_IslandProgress_01_22 " );	// Good! I will try to find it.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_23 " );	// Try it, of course! Although I do not think that here on the island you can find this kind of thing.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgress_01_24 " );	// But maybe you'll get lucky again... (laughs) And then, who knows!
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry( TOPIC_LOSTISLAND , " I showed Torlof a stone slab I found in the ancient ruins on the island. Upon examining it, he assumed that the slab depicted some kind of mysterious map. In addition, several numbers were scrawled on the back of this stone tablet, which could mean that something important - for example, the latitude and longitude of the island itself. However, to verify this version, Torlof needs a marine sextant, otherwise his calculations will be inaccurate. " );
};


instance DIA_TORLOF_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_islandprogressnext_condition;
	information = dia_torlof_li_islandprogressnext_info;
	permanent = FALSE;
	description = " I have a sextant. " ;
};


func int dia_torlof_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Torlof_LI_IslandProgressNext_01_00 " );	// I have a sextant.
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgressNext_01_01 " );	// (surprised) Really?
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgressNext_01_03 " );	// Give it here.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgressNext_01_04");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgressNext_01_05 " );	// Great! Now I can finally work on deciphering those strange symbols.
	AI_Output(other,self, " DIA_Torlof_LI_IslandProgressNext_01_06 " );	// And how long will it take you?
	AI_Output(self,other, " DIA_Torlof_LI_IslandProgressNext_01_07 " );	// I think not more than a couple of days.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgressNext_01_08");	//Хорошо.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry( TOPIC_LOSTISLAND , " I've got a sextant for Torlof. And now he can start his calculations. According to him, it will take no more than two days. " );
};

instance DIA_TORLOF_LI_SEARCH(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_search_condition;
	information = dia_torlof_li_search_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_torlof_li_search_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_00 " );	// Good to have you here. I have already finished my calculations.
	AI_Output(other,self, " DIA_Torlof_LI_Search_01_01 " );	// And how are you doing?
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_04 " );	// Hmmm...(thoughtfully) It looks like we weren't wrong in assuming that these symbols actually mean something!
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_05 " );	// I checked the chart against our previous course and made a small correction for possible drift during the storm.
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_06 " );	// And then I substituted into my calculations the numbers that were drawn on the back of the stone tile you found.
	AI_Output(other,self, " DIA_Torlof_LI_Search_01_08 " );	// What do you mean?
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_09 " );	// If we overlay them on the map in a certain sequence, then they indicate the place where we could well be at the moment.
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_10 " );	// This gives a rough idea of ​​what to do and where to go!
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_12 " );	// So as soon as the ship is ready to sail, we can weigh anchor.
	AI_Output(self,other, " DIA_Torlof_LI_Search_01_17 " );	// Yes, and more. (seriously) Here, take this card. It marks the island itself and the exact course to it.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry( TOPIC_LOSTISLAND , " Torlof finished his calculations, and they seem to be very successful. The tile that I found on this island really seemed to be a kind of map, and recording it helped Torlof with a high degree of probability to determine our location. And how only our ship will acquire the proper form, it will be possible to finally get out of this island. " );
};


instance DIA_TORLOF_LI_ABOUTISLAND(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_aboutisland_condition;
	information = dia_torlof_li_aboutisland_info;
	permanent = FALSE;
	description = " I wonder if anyone lives on this island? " ;
};


func int dia_torlof_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_island))
	{
		return TRUE;
	};
};

func void dia_torlof_li_aboutisland_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_AboutIsland_01_01 " );	// I wonder if anyone lives on this island?
	AI_Output(self,other, " DIA_Torlof_LI_AboutIsland_01_02 " );	// Hardly...(doubtful) It looks like it's not inhabited at all.
	AI_Output(self,other, " DIA_Torlof_LI_AboutIsland_01_05 " );	// Our appearance here could not go unnoticed.
	AI_Output(self,other, " DIA_Torlof_LI_AboutIsland_01_06 " );	// So if someone lived here, they would probably have already made themselves felt.
	AI_Output(self,other, " DIA_Torlof_LI_AboutIsland_01_07 " );	// In the meantime, apart from a couple of fire lizards on the shore, we have not met anyone.
};


instance DIA_TORLOF_LI_WHEREGUYS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_whereguys_condition;
	information = dia_torlof_li_whereguys_info;
	permanent = FALSE;
	description = " Where are all the other guys?! " ;
};


func int dia_torlof_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm))
	{
		return TRUE;
	};
};

func void dia_torlof_li_whereguys_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_WhereGuys_01_01 " );	// Where are all the other guys?
	AI_Output(self,other, " DIA_Torlof_LI_WhereGuys_01_02 " );	// Most of the guys went ashore as soon as we landed on this island.
	AI_Output(self,other, " DIA_Torlof_LI_WhereGuys_01_04 " );	// Well... (he hesitated) They said they wanted to scout the immediate surroundings of this island.
};


instance DIA_TORLOF_LI_WHEREGOLD(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_wheregold_condition;
	information = dia_torlof_li_wheregold_info;
	permanent = FALSE;
	description = " Where did my gold go? " ;
};


func int dia_torlof_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_wheregold_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_WhereGold_01_01 " );	// Where did my gold go?
	AI_Output(self,other, " DIA_Torlof_LI_WhereGold_01_02 " );	// (uncomprehending) What are you talking about, buddy?!
	AI_Output(other,self, " DIA_Torlof_LI_WhereGold_01_03 " );	// About the big pile of gold we took from the island of Irdorath. It was in the hold of our ship!
	AI_Output(self,other, " DIA_Torlof_LI_WhereGold_01_08 " );	// Sorry mate. But I have no idea where it went!
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry( TOPIC_MISSMYGOLD , " Torlof said he didn't know where my gold went. He told me to ask the other guys about it. " );
};


instance DIA_TORLOF_LI_MISSCOMPAS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_misscompas_condition;
	information = dia_torlof_li_misscompas_info;
	permanent = FALSE;
	description = "The bugle said you lost your compass. " ;
};


func int dia_torlof_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_torlof_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Torlof_LI_MissCompas_01_01 " );	// Horn said you lost your compass.
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_02");	//Да...(расстроенно)
	AI_Output(self,other, " DIA_Torlof_LI_MissCompas_01_04 " );	// It must have fallen out of my pocket during the storm.
	AI_Output(self,other, " DIA_Torlof_LI_MissCompas_01_05 " );	// But I'm not exactly sure...
	AI_Output(self,other, " DIA_Torlof_LI_MissCompas_01_07 " );	// Eh... (sadly) This little thing was really dear to me - a keepsake from an old friend of mine.
	AI_Output(self,other, " DIA_Torlof_LI_MissCompas_01_08 " );	// I always thought it brought me luck, and trust me, it did!
	AI_Output(self,other, " DIA_Torlof_LI_MissCompas_01_09 " );	// But now I understand that this very luck turned away from me this time.
	AI_Output(other,self, " DIA_Torlof_LI_MissCompas_01_10 " );	// Have you tried searching for it?
	AI_Output(self,other, " DIA_Torlof_LI_MissCompas_01_11 " );	// I tried, of course... (sadly) I searched the entire upper deck, but it turned out to be in vain - he's not here!
	B_LogEntry( TOPIC_MISSMYGOLD , " I asked Torlof about his compass. He seems very upset about this loss. He searched the entire upper deck of the ship, but could not find it. " );
};


instance DIA_TORLOF_LI_WHEREGOLDDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_wheregolddone_condition;
	information = dia_torlof_li_wheregolddone_info;
	permanent = FALSE;
	description = " This isn't your item, is it? " ;
};


func int dia_torlof_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Torlof_LI_WhereGoldDone_01_01 " );	// Is this your compass by any chance?
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_04 " );	// (enthusiastic) Buddy... that's my compass!
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_05 " );	// How did you manage to find it?
	AI_Output(other,self, " DIA_Torlof_LI_WhereGoldDone_01_08 " );	// I found it where my pile of gold used to be.
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_09 " );	// What are you implying, mate?
	AI_Output(other,self, " DIA_Torlof_LI_WhereGoldDone_01_12 " );	// If I were you, I'd rather tell the whole truth.
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_13 " );	// Truth?! Hmmm... (confused) But...
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_15 " );	// Oh, okay! In general ... (he hesitated) to the great regret of many crew members, he had to be thrown overboard.
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_18 " );	// And like this... (seriously) The ship rolled a lot, and if we didn't, then everyone would go to feed the fish.
	AI_Output(other,self, " DIA_Torlof_LI_WhereGoldDone_01_19 " );	// Did you throw away all the gold?!
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_27 " );	// Gold can be acquired, and you still have time to become rich!
	AI_Output(self,other, " DIA_Torlof_LI_WhereGoldDone_01_28 " );	// Better thank Innos for keeping us all alive. This is much more important!
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry( TOPIC_MISSMYGOLD , " Now everything became clear - my gold was simply thrown overboard during a storm, because due to the heavy workload, our ship listed and could easily capsize. At first, the guys did not want to tell me the whole truth, because they thought that I was very upset about it. Well, they were right, but I'll get over this loss somehow. " );
};


instance DIA_TORLOF_LI_HALLO(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 4;
	condition = dia_torlof_li_hallo_condition;
	information = dia_torlof_li_hallo_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int dia_torlof_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_aboutisland) && Npc_KnowsInfo(hero,dia_torlof_li_whereguys) && Npc_KnowsInfo(hero,dia_torlof_li_island))
	{
		return TRUE;
	};
};

func void dia_torlof_li_hallo_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_Hallo_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Torlof_LI_Hallo_01_01 " );	// So far, yes.
};


instance DIA_TORLOF_LI_BRINGFOODDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_bringfooddone_condition;
	information = dia_torlof_li_bringfooddone_info;
	permanent = FALSE;
	description = " How are we doing with the provisions? " ;
};


func int dia_torlof_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24))
	{
		return TRUE;
	};
};

func void dia_torlof_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Torlof_LI_BringFoodDone_01_01 " );	// How are we doing with provisions?
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_02 " );	// Not very good. It is slowly starting to come to an end.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_03 " );	// Why did you ask?
	AI_Output(other,self, " DIA_Torlof_LI_BringFoodDone_01_04 " );	// Some guys complain that you cut their daily food allowances.
	AI_Output(other,self, " DIA_Torlof_LI_BringFoodDone_01_05 " );	// And in my opinion, most of them did not really like this news!
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_06 " );	// Unfortunately, I had no other choice.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_07 " );	// Knowing the appetites of some of our guys, we would have nothing left in a couple of days.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_08 " );	// This is especially true for Gorn. If this troglodyte is allowed into the galley, then it will immediately destroy all our food supplies in one sitting!
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_09 " );	// And what are we going to do next?
	AI_Output(other,self, " DIA_Torlof_LI_BringFoodDone_01_12 " );	// I brought you fresh meat. There are five dozen pieces.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_17 " );	// Wow! Quite good. I think this stock will last us a long time.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_23 " );	// First, go to the galley and fry all these pieces well.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDone_01_24 " );	// And then come back to me.
	B_LogEntry( TOPIC_BRINGFOOD , " Torlof was surprised that I managed to get such a quantity of fresh meat. However, he refused to take it, because he now has no time to do all this. So he asked me to go to the galley and fry each piece well so that they do not spoil, and then bring this meat to him. " );
};


instance DIA_TORLOF_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_bringfooddoneext_condition;
	information = dia_torlof_li_bringfooddoneext_info;
	permanent = FALSE;
	description = " I've fried meat. " ;
};


func int dia_torlof_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_torlof_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_torlof_li_bringfooddoneext_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_BringFoodDoneExt_01_01 " );	// I fried the meat like you asked.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_01_02 " );	// If so, then give it here.
	Info_ClearChoices(dia_torlof_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_torlof_li_bringfooddoneext, " (give 14 meats and apples) " ,dia_torlof_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_torlof_li_bringfooddoneext,"Вот, держи.",dia_torlof_li_bringfooddoneext_sixty);
};

func void dia_torlof_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_01 " );	// Hmmm...(thoughtfully) Where is everything else?!
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_02 " );	// I thought you had more meat then than you do now.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_13 " );	// Alright though! What can we say about it now.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_14 " );	// Thank you!
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_torlof_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry( TOPIC_BRINGFOOD , " I gave Torlof the fried meat, but I didn't forget Gorn's request. Torlof was a little upset, because he wanted to increase the daily ration for the other guys a little. But now it doesn't matter anymore. " );
};

func void dia_torlof_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_01 " );	// Great! Now the guys will certainly have something to eat in the coming days.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_02 " );	// And besides, I can even slightly increase the daily ration for all members of our crew.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_03 " );	// Surely, after a few days of a little hunger strike, this will be good news for them.
	AI_Output(self,other, " DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_04 " );	// And it's all thanks to you, mate!
	Info_ClearChoices(dia_torlof_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry( TOPIC_BRINGFOOD , " I gave Torlof all the grilled meat, and now he can increase the daily ration for all crew members a little. " );
};


instance DIA_TORLOF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_findmagicorecave_condition;
	information = dia_torlof_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I have some interesting news. " ;
};


func int dia_torlof_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCave_01_01 " );	// I have some interesting news.
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCave_01_03 " );	// I discovered several caves with huge deposits of magical ores.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_04 " );	// (surprised) Really?!
		AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCave_01_05 " );	// I think this whole island is crammed to the ground with it.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_06 " );	// Hmmm...(thoughtfully) Well, that's actually pretty unusual news.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_07 " );	// Magical ore deposits are very rare! Especially, as you say, in such huge sizes.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_08 " );	// As far as I know, until recently, such reserves were only in the Valley of Mines, until the orcs came there.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_09 " );	// So if you're right - this is truly a great discovery!
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_10 " );	// Though I still don't really believe it... (doubtfully) You probably confused magic ore with ordinary stones.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_16 " );	// Bring me a small piece of the ore you found on this island.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_17 " );	// I think this will be quite enough to fully verify your words.
		AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCave_01_18 " );	// Good. I'll bring the ore.
		LITESTOK = TRUE;
		) ; _ _ _ _ _
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCave_01_19 " );	// In one of the caves on this island, I discovered large deposits of magical ore.
		AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCave_01_20 " );	// There might be even more hoards lurking on this island!
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_21 " );	// Hmmm...(thoughtfully) Well, that's actually pretty unusual news.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_22 " );	// Encountering a deposit of magical ore is very lucky! Especially, as you say, in such large sizes.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_23 " );	// As far as I know, until recently, such reserves were only in the Valley of Mines, until the orcs came there.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_24 " );	// So if you're right, it will be a truly great discovery!
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_25 " );	// Though I don't really believe it... (doubtfully) You probably confused the ore with ordinary stones.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_26 " );	// In addition, the deposits you found in this cave do not yet indicate that there can be a lot of it here.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_29 " );	// If I were you, I'd try to explore this island more carefully.
		AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCave_01_30 " );	// Maybe this would clear things up a bit with the ore you found.
		LIBEFORETESTOK = TRUE;
		B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Torlof that I discovered a cave with large deposits of magical ore on the island. He doubted my words and asked me to more carefully examine the island in order to find more evidence of the presence of this rock here. " );
	};
};


instance DIA_TORLOF_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_findmagicorecaveprogress_condition;
	information = dia_torlof_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = " I've explored the island. " ;
};


func int dia_torlof_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCaveProgress_01_01 " );	// I explored the island...
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_02");	//И?!
	AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCaveProgress_01_03 " );	// ...and found another cave. It contains even more ore than the first one!
	AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCaveProgress_01_06 " );	// I still can't believe we're so lucky!
	AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCaveProgress_01_12 " );	// Bring me a small piece of the ore you found on this island.
	AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCaveProgress_01_13 " );	// I think this will be quite enough to fully verify your words.
	AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCaveProgress_01_14 " );	// Good. I'll bring the ore.
	LITESTOK = TRUE;
	B_LogEntry( TOPIC_FINDMAGICORECAVE , " I told Torlof that I had found another magical ore cave. He asked me to bring him a small piece of this rock to make sure I was right. " );
};


instance DIA_TORLOF_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_findmagicorecavedone_condition;
	information = dia_torlof_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = " I brought you a piece of that ore. " ;
};


func int dia_torlof_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (TESTNUGGETGAVE == TRUE) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Torlof_LI_FindMagicOreCaveDone_01_01 " );	// I brought you a piece of that ore.
	AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCaveDone_01_02 " );	// Great! (sarcastically) Show it to me.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCaveDone_01_04 " );	// Hmmm...(very surprised) Yeah man - looks like you were right!
	AI_Output(self,other, " DIA_Torlof_LI_FindMagicOreCaveDone_01_05 " );	// This is indeed a magical ore.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry( TOPIC_FINDMAGICORECAVE , " I brought Torlof a piece of ore that I chipped from magical rock. After that, he did not doubt my words. " );
};


instance DIA_TORLOF_LI_CHANGECOURSE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_changecourse_condition;
	information = dia_torlof_li_changecourse_info;
	permanent = FALSE;
	description = " So what are we going to do now? " ;
};


func int dia_torlof_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_torlof_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_01_01 " );	// And what are we going to do now?
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_01_02 " );	// Hmmm...(confused) I have no idea!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_01_03 " );	// Of course, it would be nice to get our hands on all this ore.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_01_04 " );	// On the mainland, we could get a huge pile of gold for it!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_01_07 " );	// But our ship is already packed to capacity. And the ore itself weighs a lot.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_01_08 " );	// Besides, we don't make good miners.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_01_09 " );	// Do you have any ideas?
	Info_ClearChoices(dia_torlof_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_torlof_li_changecourse, " I think we should report this ore to Lord Hagen. " ,dia_torlof_li_changecourse_paladin);
	};
	Info_AddChoice(dia_torlof_li_changecourse, " We can sell this island along with the ore to someone! " ,dia_torlof_li_changecourse_sell);
	Info_AddChoice(dia_torlof_li_changecourse, " Let's stay on the island and start mining this ore. " ,dia_torlof_li_changecourse_here);
};

func void dia_torlof_li_changecourse_paladin()
{
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Paladin_01_01 " );	// I think we should report this ore to Lord Hagen.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Paladin_01_02 " );	// What? (puzzled) Give this ore to the paladins?
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Paladin_01_03 " );	// Without her, they have no chance of winning this war.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Paladin_01_04 " );	// So what?! Perhaps they have already lost it!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Paladin_01_07 " );	// Eh... (with annoyance) Okay, let it be your way.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Paladin_01_08 " );	// True, then we will have to return back to Khorinis.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Paladin_01_09 " );	// I don't think most guys would like this idea... (doubtfully)
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Paladin_01_10 " );	// I'll try to persuade them.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Paladin_01_11 " );	// As you say! Then let me know if you succeed...(snidely)
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry( TOPIC_CHANGECOURSE , " Now we need to decide what to do with the ore we found on this mysterious island. I suggested that Torlof return to Khorinis and tell the paladins about it, but he did not like this idea. Let's see what the others say And there, as most of them decide, it will be so. " );
	Info_ClearChoices(dia_torlof_li_changecourse);
};

func void dia_torlof_li_changecourse_sell()
{
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Sell_01_01 " );	// We can sell this island along with the ore!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_02 " );	// Interesting... (doubtfully) And who will buy it from us?
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Sell_01_04 " );	// Maybe paladins?
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_05 " );	// Hmmm... (thoughtfully) Well, the idea is not bad at all!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_06 " );	// Given their situation, they'll probably jump at this offer happily.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_07 " );	// Which paladin will be able to accept our terms?
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Sell_01_08 " );	// Perhaps we should take this to Lord Hagen.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_10 " );	// You're probably right. After what you did - you can definitely not doubt it!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_11 " );	// True, then we will have to return back to Khorinis.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_12 " );	// I don't think most guys would like this idea... (doubtfully)
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Sell_01_13 " );	// I'll try to persuade them.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Sell_01_14 " );	// Okay! Then let me know if you succeed...(snidely)
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry( TOPIC_CHANGECOURSE , " Now we need to decide what to do with the ore we found on this mysterious island. I gave Torlof the idea that we could sell this ore to the paladins. He liked it. However, for this we will have to return to Khorinis, so first we need to consult and find out the opinion of other members of our team. And then, as most of them decide, it will be so. " );
	Info_ClearChoices(dia_torlof_li_changecourse);
};

func void dia_torlof_li_changecourse_here()
{
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourse_Here_01_01 " );	// Let's stay on the island and mine.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Here_01_02 " );	// Hmmm...(thoughtfully) I don't think that's a good idea..
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Here_01_05 " );	// It will take years to get more or less enough ore. If not more!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Here_01_06 " );	// Besides, I'm not going to spend the rest of my life on this rotten island.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Here_01_07 " );	// (grouchily) I'm already getting fed up with him!
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourse_Here_01_08 " );	// So it's best if you get that idea out of your head.
};


instance DIA_TORLOF_LI_CHANGECOURSEDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_changecoursedone_condition;
	information = dia_torlof_li_changecoursedone_info;
	permanent = FALSE;
	description = " I've talked to all the guys. " ;
};


func int dia_torlof_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_changecoursedone_info()
{
	AI_Output(other,self, " DIA_Torlof_LI_ChangeCourseDone_01_01 " );	// I talked to all the guys.
	AI_Output(self,other, " DIA_Torlof_LI_ChangeCourseDone_01_02 " );	// (with interest) And what did they say?
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Torlof_LI_ChangeCourseDone_01_03 " );	// Most of them agree to sail to Khorinis to help the paladins.
		AI_Output(self,other, " DIA_Torlof_LI_ChangeCourseDone_01_05 " );	// Okay. If the majority decides so...
		AI_Output(self,other, " DIA_Torlof_LI_ChangeCourseDone_01_06 " );	// One can only hope that Lord Hagen and his people will really benefit from all this.
		B_LogEntry( TOPIC_CHANGECOURSE , " As a result, taking into account the opinion of the majority of the team members, it was decided to go back to Khorinis to inform the paladins about the magic ore we found on the island. " );
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self, " DIA_Torlof_LI_ChangeCourseDone_01_10 " );	// Most of them liked the idea of ​​demanding a decent amount of gold from the paladins for the ore we found.
		AI_Output(self,other, " DIA_Torlof_LI_ChangeCourseDone_01_12 " );	// I didn't expect anything else!
		B_LogEntry( TOPIC_CHANGECOURSE , " Most of the guys approved of charging paladins for a decent amount of ore. So our course is back to Khorinis. " );
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Torlof_LI_ChangeCourseDone_01_16 " );	// Opinions are divided! Half for helping the paladins - the rest against.
		AI_Output(self,other, " DIA_Torlof_LI_ChangeCourseDone_01_17 " );	// Hmmm... (thoughtfully) Not an easy situation!
		AI_Output(self,other, " DIA_Torlof_LI_ChangeCourseDone_01_19 " );	// In any case, we should probably return to the island after all!
		AI_Output(other,self, " DIA_Torlof_LI_ChangeCourseDone_01_20 " );	// Good. So let's do it.
		B_LogEntry( TOPIC_CHANGECOURSE , " The opinions of the team were divided. Half were in favor of helping the paladins - the rest were against. But despite this, Torlof and I decided to return back to Khorinis. And then decide what to do with the ore found on the island. " );
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};

