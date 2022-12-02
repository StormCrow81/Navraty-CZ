

DIA_Milten_DI_EXIT (C_Info) instances
{
	npc = PC_Mage_DI;
	nr = 999;
	condition = DIA_Milten_DI_EXIT_Condition;
	information = DIA_Milten_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Milten_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Milten_DI_Hello (C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Hello_Condition;
	information = DIA_Milten_DI_Hello_Info;
	description = " Just like in the old days. " ;
};


func int DIA_Milten_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Milten_DI_Hello_15_00 " );	// Just like in the old days.
	AI_Output(self,other, " DIA_Milten_DI_Hello_03_01 " );	// You said it yourself. I even wonder if you can get through this time.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//Ты о чем?
	AI_Output(self,other, " DIA_Milten_DI_Hello_03_03 " );	// Can you save your ass when all hell breaks loose on you again.
};


instance DIA_Milten_TRADE (C_Info);
{
	npc = PC_Mage_DI;
	nr = 12;
	condition = DIA_Milten_DI_TRADE_Condition;
	information = DIA_Milten_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Got some extra potions? " ;
};


func int DIA_Milten_TRADE_Condition()
{
	if ((UndeadDragonIsDead ==  FALSE ) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

func void DIA_Milten_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Milten_DI_TRADE_15_00 " );	// Got some extra potions?

	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
	CreateInvItems(self,ItPo_Health_02,15);
	Npc_RemoveInvItems(self,ItPo_Mana_02,Npc_HasItems(self,ItPo_Mana_02));
	CreateInvItems(self,ItPo_Mana_02,15);
	CreateInvItems(self,ItMi_Flask,3);
	AI_Output(self,other, " DIA_Milten_DI_TRADE_03_01 " );	// As long as the supply is sufficient.
};


DIA_Milten_DI_Rat (C_Info) instances
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Rat_Condition;
	information = DIA_Milten_DI_Rat_Info;
	description = " What advice can you give me? " ;
};


func int DIA_Milten_DI_Rat_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Milten_DI_Hello ) && ( UndeadDragonIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Rat_Info()
{
	AI_Output(other,self, " DIA_Milten_DI_Rat_15_00 " );	// Can you give me some advice?
	AI_Output(self,other, " DIA_Milten_DI_Rat_03_01 " );	// Mmm. It's an honor that you ask me for advice. But I have only one thing in my head all this time.
	AI_Output(self,other, " DIA_Milten_DI_Rat_03_02 " );	// Do you have the Eye of Innos?
	Info_ClearChoices(DIA_Milten_DI_Rat);
	if(SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice(DIA_Milten_DI_Rat, " Нет. " ,DIA_Milten_DI_Rat_nein);
	}
	else
	{
		Info_AddChoice(DIA_Milten_DI_Rat, " Конечно. " ,DIA_Milten_DI_Rat_ja);
	};
};

func void DIA_Milten_DI_Rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//Нет.
	AI_Output(self,other, " DIA_Milten_DI_Rat_nein_03_01 " );	// (indignantly) You're so... What will you do if you encounter dragons here on the island?
	AI_Output(self,other, " DIA_Milten_DI_Rat_nein_03_02 " );	// Haven't you wised up yet? Here we even have an alchemy table, we could safely recharge the Eye.
	AI_Output(self,other, " DIA_Milten_DI_Rat_nein_03_03 " );	// What are you thinking about? I can only hope that your hindsight does not cost us our lives.
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja()
{
	AI_Output(other,self, " DIA_Milten_DI_Rat_ja_15_00 " );	// Of course.
	AI_Output(self,other, " DIA_Milten_DI_Rat_ja_03_01 " );	// Sorry for asking such a stupid question. I'm a bit nervous.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Milten_DI_Rat);
};


instance DIA_Milten_DI_PEDROTOT (C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_PEDROTOT_Condition;
	information = DIA_Milten_DI_PEDROTOT_Info;
	description = " I found Pedro. " ;
};


func int DIA_Milten_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Milten_DI_PEDROTOT_15_00 " );	// I found Pedro.
	AI_Output(self,other, " DIA_Milten_DI_PEDROTOT_03_01 " );	// What?! Where?!...(amazed) Here on the island? Damn, this is truly incredible.
	AI_Output(self,other, " DIA_Milten_DI_PEDROTOT_03_02 " );	// Now I won't think he's such an idiot.
	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self, " DIA_Milten_DI_PEDROTOT_15_03 " );	// He's dead.
		AI_Output(self,other, " DIA_Milten_DI_PEDROTOT_03_04 " );	// Yes? Good. May his ashes rest in peace. Although I can't say that I feel sorry for him, I still wouldn't mind asking him a few questions.
	}
	else
	{
		AI_Output(self,other, " DIA_Milten_DI_PEDROTOT_03_05 " );	// I have an old score with him.
	};
};


instances of DIA_Milten_DI_TeachMagic (C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_TeachMagic_Condition;
	information = DIA_Milten_DI_TeachMagic_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};


func int DIA_Milten_DI_TeachMagic_Condition()
{
	if ((UndeadDragonIsDead ==  FALSE ) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_TeachMagic_OneTime;

func void DIA_Milten_DI_TeachMagic_Info()
{
	AI_Output(other,self, " DIA_Milten_DI_TeachMagic_15_00 " );	// I want to increase my magical abilities.
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_03_01 " );	// I'll do my best.
	}
	else if(DIA_Milten_DI_TeachMagic_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_03_02 " );	// I'll help you, but only if you make sure the orcs stay where they are now.
		DIA_Milten_DI_TeachMagic_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_03_03 " );	// Good. What do you require?
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " Create Rune " ,DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_MANA_1_03_00 " );	// May the hand of Innos guide you.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " Create Rune " ,DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_MANA_5_03_00 " );	// May Innosa light your path.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " Create Rune " ,DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	AI_Output(self,other, " DIA_Milten_DI_TeachMagic_RUNES_03_00 " );	// Oh no! I'm not much of an expert on this, but we'll manage somehow.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " Circle Four " ,DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " Circle Five " ,DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " Circle Six " ,DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[93] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_milten_di_teachmagic_runen_circle_4_spl_firelight);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Explosion);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
};


instances of DIA_Milten_DI_DementorObsessionBook (C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DementorObsessionBook_Condition;
	information = DIA_Milten_DI_DementorObsessionBook_Info;
	description = " Does this book, Almanac of the Taken, tell you something? " ;
};


func int DIA_Milten_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self, " DIA_Milten_DI_DementorObsessionBook_15_00 " );	// Does this book, Almanac of the Taken, tell you something?
	AI_Output(self,other, " DIA_Milten_DI_DementorObsessionBook_03_01 " );	// Pirocar is an expert on such books.
	AI_Output(self,other, " DIA_Milten_DI_DementorObsessionBook_03_02 " );	// Sorry. I know too little to say anything smart about it.
	B_GivePlayerXP(XP_Ambient);
};


instances DIA_Milten_DI_DragonEgg (C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DragonEgg_Condition;
	information = DIA_Milten_DI_DragonEgg_Info;
	description = " Have you dealt with dragon eggs? " ;
};


func int DIA_Milten_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DragonEgg_Info()
{
	AI_Output(other,self, " DIA_Milten_DI_DragonEgg_15_00 " );	// Have you dealt with dragon eggs?
	AI_Output(self,other, " DIA_Milten_DI_DragonEgg_03_01 " );	// No, not exactly. I heard that a skilled alchemist was somehow able to brew a potion out of them.
	AI_Output(self,other, " DIA_Milten_DI_DragonEgg_03_02 " );	// But please don't ask me for the recipe. I have no idea how it's prepared.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_UndeadDragonDead_Condition;
	information = DIA_Milten_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " Good. It's done! " ;
};


func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_UndeadDragonDead_OneTime;

func void DIA_Milten_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Milten_DI_UndeadDragonDead_15_00 " );	// Good. It is done! The temple is now stripped of its power.
	if(DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_01 " );	// How do you always manage to get away with it?
		AI_Output(other,self, " DIA_Milten_DI_UndeadDragonDead_15_02 " );	// Damn me if I know.
		AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_03 " );	// (laughs) Will we ever be able to live in peace? We definitely deserve it.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self, " DIA_Milten_DI_UndeadDragonDead_15_04 " );	// What are you going to do now?
			AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_05 " );	// I'm thinking about starting my own academy to preach our faith. But nothing may come of it.
			AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_06 " );	// I never regretted becoming a Fire Mage. And how do you like it?
			AI_Output(other,self, " DIA_Milten_DI_UndeadDragonDead_15_07 " );	// I don't even know.
			AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_08 " );	// (laughs) Dry as always. Hey guy. You just saved the world. Isn't that enough reason to rejoice?
			AI_Output(other,self, " DIA_Milten_DI_UndeadDragonDead_15_09 " );	// Mmm. May be.
		};
		AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_10 " );	// Come on, buddy, I think the main thing you need right now is to get some sleep.
		DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other, " DIA_Milten_DI_UndeadDragonDead_03_11 " );	// You need to go to the captain and tell him to raise anchor.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instances DIA_Mage_DI_PICKPOCKET (C_Info)
{
	npc = PC_Mage_DI;
	nr = 900;
	condition = DIA_Mage_DI_PICKPOCKET_Condition;
	information = DIA_Mage_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mage_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 120 );
};

func void DIA_Mage_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,Dialog_Back,DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

