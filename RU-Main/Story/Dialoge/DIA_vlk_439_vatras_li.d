

var int dia_addon_vatras_pissoffforevver_li_onetime;
var int trd_vatli;

instance DIA_VATRAS_LI_EXIT(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 999;
	condition = dia_vatras_li_exit_condition;
	information = dia_vatras_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_vatras_li_exit_condition()
{
	return TRUE;
};

func void dia_vatras_li_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VATRAS_LI_HEAL (C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 99;
	condition = dia_vatras_li_heal_condition;
	information = dia_vatras_li_heal_info;
	permanent = TRUE;
	description = " Heal me. " ;
};

func int dia_vatras_li_heal_condition()
{
	return TRUE;
};

func void dia_vatras_li_heal_info()
{
	AI_Output(other,self, " DIA_Vatras_DI_HEAL_15_00 " );	// Heal me.

	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other, " DIA_Vatras_DI_HEAL_05_01 " );	// Adanos, bless him! He will be the one to restore the balance of the world.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_FullyHealed);
	}
	else
	{
		AI_Output(self,other, " DIA_Vatras_DI_HEAL_05_02 " );	// Your body is intact!
	};
};


instance DIA_VATRAS_LI_TRADE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 12;
	condition = dia_vatras_li_trade_condition;
	information = dia_vatras_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Can you sell me something? " ;
};


func int dia_vatras_li_trade_condition()
{
	return TRUE;
};

func void dia_vatras_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Vatras_DI_TRADE_15_00 " );	// Can you sell me something to sell?
	AI_Output(self,other, " DIA_Vatras_DI_TRADE_05_01 " );	// What do you need?

	if ( TRD_VATLI  !=  TRUE )
	{
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		CreateInvItems(self,ItPl_Temp_Herb,4);
		CreateInvItems(self,ItSc_LightHeal,2);
		CreateInvItems(self,ItSc_Zap,2);
		CreateInvItems(self,ItSc_Icebolt,2);
		CreateInvItems(self,itsc_sumicegol,2);
		CreateInvItems(self,ItSc_Icelance,5);
		CreateInvItems(self,ItSc_LightningFlash,1);
		CreateInvItems(self,ItSc_TrfScavenger,1);
		CreateInvItems(self,ItSc_IceWave,2);
		CreateInvItems(self,ItPo_Health_03,10);
		CreateInvItems(self,ItPo_Mana_02,12);
		CreateInvItems(self,ItPo_Mana_03,10);
		TRD_VATLI = TRUE ;
	};

	B_GiveTradeInv(self);
};

instance DIA_VATRAS_LI_VATRASSUCKED(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 1;
	condition = dia_vatras_li_vatrassucked_condition;
	information = dia_vatras_li_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_vatras_li_vatrassucked_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE) && (VATRASFORGIVENME == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_li_vatrassucked_info()
{
	AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_00 " );	// Get out of my sight, murderer! You can no longer count on my help!
	AI_Output(other,self, " DIA_Vatras_DI_VatrasSucked_05_10 " );	// After everything I've done, you still refuse to listen to me?
	AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_11 " );	// Yes, your merits are great! But they don't justify all the things you've done before.
	AI_Output(other,self, " DIA_Vatras_DI_VatrasSucked_05_12 " );	// But all of us, humans, sometimes make mistakes in our actions.
	AI_Output(other,self, " DIA_Vatras_DI_VatrasSucked_05_13 " );	// I admit that I was wrong in doing such atrocities. Forgive me, father! Change your anger to mercy.
	AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_14 " );	// Hmmm...(doubtful) It's not as easy as you think, my son.
	AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_15 " );	// Of course I can forgive you, but will Adanos forgive you?
	AI_Output(other,self, " DIA_Vatras_DI_VatrasSucked_05_16 " );	// I'll try to beg forgiveness from him too.
	AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_17 " );	// Well... (seriously) I hope your words are as serious as your intentions!
	AI_Output(self,other, " DIA_Vatras_DI_VatrasSucked_05_18 " );	// Okay, consider yourself forgiven! Let the gods themselves decide what to do with you for your sins.
	VATRASFORGIVENME = TRUE;
};

instance DIA_VATRAS_LI_TALENTE (C_Info)
{
	npc = vlk_439_vatras_li;
	condition = dia_vatras_li_talente_condition;
	information = dia_vatras_li_talente_info;
	permanent = TRUE;
	description = " Teach me your abilities. " ;
};

func int dia_vatras_li_talente_condition()
{
	return TRUE;
};

func void dia_vatras_li_talente_info()
{
	AI_Output(other,self, " DIA_Vatras_DI_Talente_15_00 " );	// Teach me your abilities.
	AI_Output(self,other, " DIA_Vatras_DI_Talente_05_01 " );	// I'll do my best.
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if ((hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
	{
		Info_AddChoice(dia_vatras_li_talente, " Learn Magic Circles " ,dia_vatras_li_talente_circles);
	};

	Info_AddChoice(dia_vatras_li_talente, " Learn Alchemy " ,dia_vatras_li_talente_alchimie);
};

func void dia_vatras_li_talente_circles()
{
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString( " 4 Круг магии " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 4 )),dia_vatras_li_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString( " 5 Круг магии " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 5 )),dia_vatras_li_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString( " 6 Круг магии " ,B_GetLearnCostTalent(other, NPC_TALENT_MAGE , 6 )),dia_vatras_li_talente_circle_6);
	};
};

func void dia_vatras_li_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talent,b_buildlearnstringforalchemy( " Material Cost " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_01)),dia_vatras_li_talent_potion_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talent,b_buildlearnstringforalchemy( " Chemical Cost " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_02)),dia_vatras_li_talent_02_potion_health);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talent,b_buildlearnstringforalchemy( " Magic " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_03)),dia_vatras_li_talent_potion_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy( " Ессенция маны " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_01)),dia_vatras_li_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy( " Екстракт маны " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_02)),dia_vatras_li_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy( " Эликсир маны " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_03)),dia_vatras_li_talente_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy( " Напиток экспления " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Speed)),dia_vatras_li_talente_potion_speed);
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy( " Double Speed ​​Drink " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_SPEED_02 )),dia_vatras_di_talente_potion_speed_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир силы ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),dia_vatras_li_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talent,b_buildlearnstringforalchemy( " Learn CostTalent " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_PERM_DEX)),dia_vatras_li_talent_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy( " Эликсир духа " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_Mana)),dia_vatras_li_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_vatras_li_talente_potion_perm_health);
	};
};

func void dia_vatras_li_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,4);
};

func void dia_vatras_li_talente_circle_5()
{
	AI_Output(self,other, " DIA_Vatras_DI_Talente_Circle_5_05_00 " );	// Now you're a mage of the fifth circle! Use your spells wisely.
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,5);
};

func void dia_vatras_li_talente_circle_6()
{
	AI_Output(self,other, " DIA_Vatras_DI_Talente_Circle_6_05_00 " );	// You now have access to the higher knowledge of magic.
	AI_Output(self,other, " DIA_Vatras_DI_Talente_Circle_6_05_01 " );	// Be guided by reason and know your human weaknesses. They can destroy you.
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,6);
};

func void dia_vatras_li_talente_potion_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_vatras_li_talente_potion_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_vatras_li_talente_potion_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_vatras_li_talente_potion_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_vatras_li_talente_potion_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_vatras_li_talente_potion_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_vatras_li_talente_potion_speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void dia_vatras_li_talente_potion_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
};

func void dia_vatras_li_talente_potion_perm_str()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void dia_vatras_li_talente_potion_perm_dex()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void dia_vatras_li_talente_potion_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void dia_vatras_li_talente_potion_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_vatras_li_talente_back()
{
	Info_ClearChoices(dia_vatras_li_talente);
};

instance DIA_ADDON_VATRAS_LI_MISSMYGOLD(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_missmygold_condition;
	information = dia_addon_vatras_li_missmygold_info;
	permanent = FALSE;
	description = " Does the servant of Adanos happen to know where my gold went? " ;
};


func int dia_addon_vatras_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_LI_MissMyGold_01_01 " );	// Does the servant of Adanos happen to know where my gold went?
	AI_Output(self,other, " DIA_Addon_Vatras_LI_MissMyGold_01_02 " );	// I don't know, my son... (seriously) Besides, this sort of thing doesn't interest me much.
	B_LogEntry( TOPIC_MISSMYGOLD , " Of course Vatras doesn't know anything about my missing gold. " );
};


instance DIA_ADDON_VATRAS_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_findmagicorecave_condition;
	information = dia_addon_vatras_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_addon_vatras_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_FindMagicOreCave_01_02 " );	// Really?!...(surprised) Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_ADDON_VATRAS_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_changecourse_condition;
	information = dia_addon_vatras_li_changecourse_info;
	permanent = FALSE;
	description = " I need your advice. " ;
};


func int dia_addon_vatras_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Addon_Vatras_LI_ChangeCourse_01_00 " );	// I need your advice.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_01_01 " );	// How can I help you, my son?
	AI_Output(other,self, " DIA_Addon_Vatras_LI_ChangeCourse_01_02 " );	// We need to decide what to do with the ore we found on this island.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_01_03 " );	// Hmmm...(thoughtfully) Do you have any ideas about this yourself?
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
	Info_AddChoice(dia_addon_vatras_li_changecourse, " I think we should tell the paladins about her. " ,dia_addon_vatras_li_changecourse_ore);
	Info_AddChoice(dia_addon_vatras_li_changecourse, " I'm sure the paladins will pay us well for this ore! " ,dia_addon_vatras_li_changecourse_gold);
};

func void dia_addon_vatras_li_changecourse_ore()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_01 " );	// I think we should tell the paladins about her.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_03 " );	// I fully and completely approve of your plans, my son... (seriously)
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_04 " );	// You're right. We must report this to Lord Hagen immediately.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_05 " );	// Hmmm...(thoughtfully) really, we'll need to go back to Khorinis for that.
	AI_Output(other,self, " DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_08 " );	// Thanks for the tip.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_09 " );	// May Adanos be with you!
	B_LogEntry( TOPIC_CHANGECOURSE , " Vatras thinks we should just go back to Khorinis and tell the paladins about the ore. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys! Now it's time to tell our captain. " );
	};
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
};

func void dia_addon_vatras_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_01 " );	// I'm sure the paladins will pay us well for this ore. She just needs them!
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_02 " );	// I don't really like your thoughts, my son... (seriously) Using someone else's need for your own benefit is an act that cannot be worthy of respect.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_05 " );	// It seemed to me that you always put the concept of honor and nobility higher than the dull sheen of gold.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_06 " );	// But apparently I was wrong!...(sadly)
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_07 " );	// Of course, the decision is up to you.
	AI_Output(self,other, " DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_08 " );	// But I don't approve of your plans!
	B_LogEntry( TOPIC_CHANGECOURSE , " Vatras didn't approve of my idea of ​​charging paladins for gold for magic ore we found. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys! Now it's time to tell our captain. " );
	};
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
};

