

var you trd_diegoli;

instance DIA_PC_THIEF_LI_EXIT(C_Info)
{
	npc = pc_thief_li;
	nr = 999;
	condition = dia_pc_thief_li_exit_condition;
	information = dia_pc_thief_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pc_thief_li_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_LI_HELLOS(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_hellos_condition;
	information = dia_thief_li_hellos_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thief_li_hellos_condition()
{
	return TRUE;
};

func void dia_thief_li_hellos_info()
{
	AI_Output(self,other, " DIA_Thief_LI_HelloS_01_01 " );	// So, we're all together again... (smiles) Just like in the good old days!
	AI_Output(other,self, " DIA_Thief_LI_HelloS_01_02 " );	// Looks like it. And what are we going to do now?
	AI_Output(self,other, " DIA_Thief_LI_HelloS_01_03 " );	// Well, I don't think you should take any hasty actions at first.
	AI_Output(self,other, " DIA_Thief_LI_HelloS_01_04 " );	// After all, no one knows what secrets this island hides.
	AI_Output(other,self, " DIA_Thief_LI_HelloS_01_05 " );	// And why did you get off the ship then?
	AI_Output(self,other, " DIA_Thief_LI_HelloS_01_06 " );	// After this storm, I and most of the guys got uncomfortable there. And yes, it's much quieter here.
};


instance DIA_THIEF_LI_ILL(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_ill_condition;
	information = dia_thief_li_ill_info;
	permanent = FALSE;
	description = " You don't look too happy. " ;
};


func int dia_thief_li_ill_condition()
{
	return TRUE;
};

func void dia_thief_li_ill_info()
{
	AI_Output(other,self, " DIA_Thief_LI_Ill_01_01 " );	// You don't look too happy.
	AI_Output(self,other, " DIA_Thief_LI_Ill_01_04 " );	// It's all bloody rocking, mate! I haven't been on board any ship in ten years.
	AI_Output(self,other, " DIA_Thief_LI_Ill_01_05 " );	// And then there's this storm! In the end, my stomach couldn't take it all.
	AI_Output(self,other, " DIA_Thief_LI_Ill_01_08 " );	// If I had a few healing herbs on hand, they might be able to revive me a little.
	AI_Output(other,self, " DIA_Thief_LI_Ill_01_09 " );	// How much do you need?
	AI_Output(self,other, " DIA_Thief_LI_Ill_01_10 " );	// Well, I don't know for sure... But I think that five plants will be enough.
	MIS_DIEGOILL = LOG_Running;
	Log_CreateTopic(TOPIC_DIEGOILL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DIEGOILL,LOG_Running);
	B_LogEntry( TOPIC_DIEGOILL , " Diego got sick during the storm and doesn't feel well now. He asked me to bring him some healing plants to bring him back to his senses. Five should be enough. " );
};


instance DIA_THIEF_LI_ILLDONE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_illdone_condition;
	information = dia_thief_li_illdone_info;
	permanent = FALSE;
	description = " I brought you healing herbs. " ;
};


func int dia_thief_li_illdone_condition()
{
	if((MIS_DIEGOILL == LOG_Running) && (Npc_HasItems(other,ItPl_Health_Herb_01) >= 5))
	{
		return TRUE;
	};
};

func void dia_thief_li_illdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Thief_LI_IllDone_01_01 " );	// I brought you healing herbs.
	AI_Output(self,other, " DIA_Thief_LI_IllDone_01_02 " );	// Great! Give them here.
	AI_Output(other,self,"DIA_Thief_LI_IllDone_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ItPl_Health_Herb_01,5);
	B_UseItem(self,ItPl_Health_Herb_01);
	AI_Output(self,other, " DIA_Thief_LI_IllDone_01_04 " );	// Wow... that's a lot better. Thank you buddy!
	MIS_DIEGOILL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DIEGOILL,LOG_SUCCESS);
	B_LogEntry( TOPIC_DIEGOILL , " I brought some herbs for Diego. He seems to be feeling better. " );
};


instance DIA_THIEF_LI_ILLDONES(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_illdones_condition;
	information = dia_thief_li_illdones_info;
	permanent = TRUE;
	description = " How are you feeling? " ;
};


func int dia_thief_li_illdones_condition()
{
	if(MIS_DIEGOILL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_thief_li_illdones_info()
{
	AI_Output(other,self, " DIA_Thief_LI_IllDones_01_01 " );	// How do you feel?
	AI_Output(self,other, " DIA_Thief_LI_IllDones_01_02 " );	// Much better now! These healing herbs were exactly what I needed.
};


instance DIA_DIEGO_LI_TRADE(C_Info)
{
	npc = pc_thief_li;
	nr = 12;
	condition = dia_diego_li_trade_condition;
	information = dia_diego_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " I need equipment. " ;
};


func int dia_diego_li_trade_condition()
{
	return TRUE;
};

func void dia_diego_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Diego_DI_TRADE_15_00 " );	// I need ammo.
	AI_Output(self,other, " DIA_Diego_DI_TRADE_11_01 " );	// Maybe I can help you out.

	if(TRD_DIEGOLI != TRUE)
	{
		CreateInvItems(self,ItRw_Arrow,160);
		CreateInvItems(self,ItRw_Bolt,120);
		CreateInvItems(self,ItKE_lockpick,20);
		CreateInvItems(self,ItRw_Bow_H_04,1);
		TRD_DIEGOLI = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_PC_THIEF_LI_TRAINING_TALENTE(C_Info)
{
	npc = pc_thief_li;
	nr = 10;
	condition = dia_pc_thief_li_training_talente_condition;
	information = dia_pc_thief_li_training_talente_info;
	permanent = TRUE;
	description = " Train me. " ;
};


func int dia_pc_thief_li_training_talente_condition()
{
	return TRUE;
};

func void dia_pc_thief_li_training_talente_info()
{
	AI_Output(other,self, " DIA_PC_Thief_DI_Training_15_00 " );	// Train me.
	AI_Output(self,other, " DIA_PC_Thief_DI_Training_11_01 " );	// What do you need?
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_li_training_talente);
};

func void dia_pc_thief_li_training_dex_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_DEX_1_11_00 " );	// You'll feel much better if you stay out of the line of fire.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_dex_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_DEX_5_11_00 " );	// When you move, always remember how easy cats move. The rest will come by itself.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_combat_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00 " );	// For best results, practice more.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_combat_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00 " );	// To keep your hand from shaking, try to slow your breathing while aiming.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};


instance DIA_THIEF_LI_PICKPOCKET(C_Info)
{
	npc = pc_thief_li;
	nr = 900;
	condition = dia_thief_li_pickpocket_condition;
	information = dia_thief_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_thief_li_pickpocket_condition()
{
	return  C_Robbery ( 120 , 600 );
};

func void dia_thief_li_pickpocket_info()
{
	Info_ClearChoices(dia_thief_li_pickpocket);
	Info_AddChoice(dia_thief_li_pickpocket,Dialog_Back,dia_thief_li_pickpocket_back);
	Info_AddChoice(dia_thief_li_pickpocket,DIALOG_PICKPOCKET,dia_thief_li_pickpocket_doit);
};

func void dia_thief_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_thief_li_pickpocket);
};

func void dia_thief_li_pickpocket_back()
{
	Info_ClearChoices(dia_thief_li_pickpocket);
};


instance DIA_THIEF_LI_MISSMYGOLD(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_missmygold_condition;
	information = dia_thief_li_missmygold_info;
	permanent = FALSE;
	description = " I want to ask you about my gold. " ;
};


func int dia_thief_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_thief_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Thief_LI_MissMyGold_01_01 " );	// I want to ask you about my gold.
	AI_Output(self,other, " DIA_Thief_LI_MissMyGold_01_02 " );	// Is there something wrong with him?
	AI_Output(other,self, " DIA_Thief_LI_MissMyGold_01_03 " );	// No, he's fine, except for the fact that he's gone!
	AI_Output(self,other, " DIA_Thief_LI_MissMyGold_01_04 " );	// (surprised) So why not?
	AI_Output(other,self, " DIA_Thief_LI_MissMyGold_01_05 " );	// The hold of our ship is completely empty!
	AI_Output(self,other, " DIA_Thief_LI_MissMyGold_01_06 " );	// (bewildered) That's the news!
	AI_Output(self,other, " DIA_Thief_LI_MissMyGold_01_09 " );	// I had no idea it had gone anywhere.
	B_LogEntry( TOPIC_MISSMYGOLD , " Diego also doesn't know how my gold got lost from the ship's hold. " );
};


instance DIA_THIEF_LI_AWAY(C_Info)
{
	npc = pc_thief_li;
	nr = 3;
	condition = dia_thief_li_away_condition;
	information = dia_thief_li_away_info;
	permanent = FALSE;
	description = " Our ship is ready to sail... " ;
};


func int dia_thief_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (DIEGOLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Thief_LI_Away_01_03 " );	// Our ship is ready to sail, and at the first tide we set sail.
	AI_Output(self,other, " DIA_Thief_LI_Away_01_04 " );	// Hmmm...(snidely) Then I guess we should hurry back to the ship.
	AI_Output(self,other, " DIA_Thief_LI_Away_01_05 " );	// Otherwise I don't want to be stuck here for the rest of my life.
	B_LogEntry( TOPIC_GATHERCREW , " Diego was glad to be able to get off the island. " );
	DIEGOLIONBOARD = TRUE;
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


instance DIA_THIEF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_findmagicorecave_condition;
	information = dia_thief_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_thief_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Thief_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Thief_LI_FindMagicOreCave_01_02 " );	// (surprised) Really? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Thief_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_THIEF_LI_CHANGECOURSE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_changecourse_condition;
	information = dia_thief_li_changecourse_info;
	permanent = FALSE;
	description = " We should head back to Khorinis. " ;
};


func int dia_thief_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_thief_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_01_00 " );	// We should head back to Khorinis.
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_01_01 " );	// Why do we suddenly need to do this?
	Info_ClearChoices(dia_thief_li_changecourse);
	Info_AddChoice(dia_thief_li_changecourse, " We must help the paladins! " ,dia_thief_li_changecourse_ore);
	Info_AddChoice(dia_thief_li_changecourse, " This is gold. " ,dia_thief_li_changecourse_gold);
};

func void dia_thief_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Ore_01_01 " );	// We must help the paladins!
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Ore_01_02 " );	// Interesting... And how are you going to do it?
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Ore_01_03 " );	// We need to tell them about the magical ore we found on this island.
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Ore_01_05 " );	// I feel like we're minding our own business.
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Ore_01_08 " );	// But this may be our last hope against the orcs!
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Ore_01_09 " );	// So this is in our interest too.
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Ore_01_10 " );	// Oh, okay... (grouchily) Looks like you're really serious about doing this.
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Ore_01_11 " );	// So are you with me?
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Ore_01_12 " );	// Good! But don't think I'm doing this for the paladins.
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Ore_01_13 " );	// I'll swim with you just because you're my friend and we've been through a lot together.
	B_LogEntry( TOPIC_CHANGECOURSE , " After much argument, Diego finally agreed to sail with me back to Khorinis. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_thief_li_changecourse);
};

func void dia_thief_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Gold_01_01 " );	// It's about gold.
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Gold_01_02 " );	// (with interest) About gold? ..
	AI_Output(other,self, " DIA_Thief_LI_ChangeCourse_Gold_01_03 " );	// I think Lord Hagen will pay a decent amount of gold for information about the ore we found on this island.
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Gold_01_06 " );	// Okay...(maliciously) Then you can consider that I'm with you!
	AI_Output(self,other, " DIA_Thief_LI_ChangeCourse_Gold_01_07 " );	// I think I could do with stuffing my pockets with gold, too.
	B_LogEntry( TOPIC_CHANGECOURSE , " Diego has agreed to sail with me back to Khorinis. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_thief_li_changecourse);
};

