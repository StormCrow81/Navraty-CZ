

instance DIA_Bennet_DI_EXIT (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 999;
	condition = DIA_Bennet_DI_EXIT_Condition;
	information = DIA_Bennet_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_Hello (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 10;
	condition = DIA_Bennet_DI_Hello_Condition;
	information = DIA_Bennet_DI_Hello_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};


func int DIA_Bennet_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Bennet_DI_Hello_15_00 " );	// Are you okay?

	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Bennet_DI_Hello_06_01 " );	// The forge on the ship is a bit rusty. Sea salt corrodes it. It won't be easy to forge something decent here. Well, other than that...
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_DI_Hello_06_02 " );	// Yes. Unless the orcs come back.
	};
};


instance DIA_Bennet_DI_TRADE (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_TRADE_Condition;
	information = DIA_Bennet_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " What weapon can you sell me? " ;
};


func int DIA_Bennet_DI_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Bennet_DI_TRADE_15_00 " );	// What weapon can you sell me?
	AI_Output(self,other, " DIA_Bennet_DI_TRADE_06_01 " );	// You know - only the best.
	B_GiveTradeInv(self);
};


instance DIA_Bennet_DI_Smith (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_Smith_Condition;
	information = DIA_Bennet_DI_Smith_Info;
	permanent = TRUE;
	description = " Can you teach me how to forge weapons? " ;
};

func int DIA_Bennet_DI_Smith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Smith_Info()
{
	AI_Output(other,self, " DIA_Bennet_DI_Smith_15_00 " );	// Can you teach me how to forge?
	AI_Output(self,other, " DIA_Bennet_DI_Smith_06_01 " );	// Depends on what you want to be able to do.
	Info_ClearChoices(DIA_Bennet_DI_Smith);
	Info_AddChoice(DIA_Bennet_DI_Smith,Dialog_Back,DIA_Bennet_DI_Smith_BACK);

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_DI_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_DI_Smith_1hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_DI_Smith_2hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_DI_Smith_1hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_DI_Smith_2hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_DI_Smith_1hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_DI_Smith_2hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_DI_Smith_1hSpecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_DI_Smith_2hSpecial4);
		};
	};
};

func void DIA_Bennet_DI_Smith_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_Smith);
};

func void DIA_Bennet_DI_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void DIA_Bennet_DI_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_DI_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_DI_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_DI_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_DI_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_DI_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_DI_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_DI_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_Bennet_TeachSTR(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 150;
	condition = DIA_Bennet_TeachSTR_Condition;
	information = DIA_Bennet_TeachSTR_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};

func int DIA_Bennet_TeachSTR_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSTR_Info()
{
	AI_Output(other,self, " DIA_Bennet_TeachSTR_15_00 " );	// I want to get stronger.
	AI_Output(self,other, " DIA_Bennet_TeachSTR_06_01 " );	// These days, a firm hand never hurts.
	Info_ClearChoices(DIA_Bennet_TeachSTR);
	Info_AddChoice(DIA_Bennet_TeachSTR,Dialog_Back,DIA_Bennet_TeachSTR_Back);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};

func void DIA_Bennet_TeachSTR_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachSTR);
};

func void DIA_Bennet_TeachSTR_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
};

func void DIA_Bennet_TeachSTR_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};


instance DIA_Bennet_DI_DragonEgg (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 99;
	condition = DIA_Bennet_DI_DragonEgg_Condition;
	information = DIA_Bennet_DI_DragonEgg_Info;
	permanent = FALSE;
	description = " I have a dragon egg. " ;
};

func int DIA_Bennet_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_DragonEgg_Info()
{
	AI_Output(other,self, " DIA_Bennet_DI_DragonEgg_15_00 " );	// I have a dragon egg.
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_01");	//И?
	AI_Output(other,self, " DIA_Bennet_DI_DragonEgg_15_02 " );	// Well. I thought...
	AI_Output(self,other, " DIA_Bennet_DI_DragonEgg_06_03 " );	// I know what you're thinking. Forget about it and keep the egg for yourself. I don't need it.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bennet_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_UndeadDragonDead_Condition;
	information = DIA_Bennet_DI_UndeadDragonDead_Info;
	permanent = FALSE;
	description = " We've done everything that needed to be done. " ;
};

func int DIA_Bennet_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Bennet_DI_UndeadDragonDead_15_00 " );	// We've done everything that needed to be done.
	AI_Output(self,other, " DIA_Bennet_DI_UndeadDragonDead_06_01 " );	// Glad to hear it. I'm already tired of this old forge. I want to be on solid ground again.
	AI_StopProcessInfos(self);
};


instances DIA_Bennet_DI_PICKPOCKET (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 900;
	condition = DIA_Bennet_DI_PICKPOCKET_Condition;
	information = DIA_Bennet_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bennet_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 35 , 65 );
};

func void DIA_Bennet_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,Dialog_Back,DIA_Bennet_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Bennet_DI_PICKPOCKET_DoIt);
};

func void DIA_Bennet_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

func void DIA_Bennet_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

instance DIA_Bennet_DI_BetterArmor (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Condition;
	information = DIA_Bennet_DI_BetterArmor_Info;
	permanent = FALSE;
	description = " Do you have better armor? " ;
};

func int DIA_Bennet_DI_BetterArmor_Condition()
{
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_TPL))
	{
		if((SBMode == TRUE) || (RealMode[2] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_DI_BetterArmor_Info()
{
	AI_Output(other,self, " DIA_Bennet_DI_BetterArmor_01_00 " );	// Do you have better armor?
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_01_01 " );	// Hmmm...(thoughtfully) I can forge for you the finest armor you've ever seen.
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_01_02 " );	// However, they require a huge variety of material to create.
	AI_Output(other,self, " DIA_Bennet_DI_BetterArmor_01_03 " );	// Which one exactly?
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_01_04 " );	// For starters, that's fifty dragon scales! They will serve as the basis for creating the breastplate of the upper part of the armor and leg guards.
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_01_05 " );	// Further, in order to give the armor proper strength, it will have to be coated with magic ore. And this is at least two dozen pieces!
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_01_06 " );	// Also, ten pieces of sulfur, five black pearls, two pots of resin and, most importantly, four pieces of the frontal dragon bone will go into work.
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_01_07 " );	// If you can get it all, you'll have the strongest armor in the whole wide world!
	MIS_BetterArmor = LOG_Running;
	Log_CreateTopic(TOPIC_BetterArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_Running);
	B_LogEntry(TOPIC_BetterArmor, " According to Bennett, he will be able to make armor of exceptional strength for me! However, for this he will need a huge amount of various materials, namely, fifty dragon scales, two dozen pieces of magic ore, ten pieces of sulfur, five black pearls, two a pot of resin and, most importantly, four pieces of a frontal dragon bone. If I get all this for him, he will make this armor for me for free. " );
};

instance DIA_Bennet_DI_BetterArmor_Done (C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Done_Condition;
	information = DIA_Bennet_DI_BetterArmor_Done_Info;
	permanent = FALSE;
	description = " I have everything you asked for. " ;
};

func int DIA_Bennet_DI_BetterArmor_Done_Condition()
{
	if ((MY_BetterArmor == LOG_Running) && (DayStartArmor ==  FALSE ) && (Npc_HasItems(other,It's_DragonScale) >=  50 ) && (Npc_HasItems(other,It's_XragonSkull) >=  4 ) && (Npc_HasItems(other,It's_XragonSkull) >= 20 ) && (Npc_HasItems(other,It's_DragonSkull) >=  20 ) ) && (Npc_HasItems(other,ItMi_Sulfur) >=  10 ) && (Npc_HasItems(other,ItMi_Pitch) >=  2 ) && (Npc_HasItems(other,ItMi_DarkPearl) >=  5 ))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self, " DIA_Bennet_DI_BetterArmor_Done_01_00 " );	// I have everything you asked for.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItAt_DragonScale,50);
	Npc_RemoveInvItems(hero,ItAt_XragonSkull,4);
	Npc_RemoveInvItems(hero,ItMi_Nugget,20);
	Npc_RemoveInvItems(hero,ItMi_Pitch,2);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);

	if(Trophy_DragonSkull  == TRUE)
	{
		if(Npc_HasItems(other,ItAt_XragonSkull) == FALSE)
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_DragonSkull,Npc_HasItems(other,ItUt_DragonSkull));
			Trophy_DragonSkull  = FALSE;
		};
	};

	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Done_01_01 " );	// Okay... (approvingly) Then I'll get to work right away.
	AI_Output(other,self, " DIA_Bennet_DI_BetterArmor_Done_01_02 " );	// How long does it take you to make them?
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Done_01_03 " );	// Hard to say! But I'll let you know as soon as they're ready.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Хорошо.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor, " I gave Bennett all the materials he needed for the armor and he immediately got to work. He doesn't know how long it will take. " );
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_DI_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Finish_Condition;
	information = DIA_Bennet_DI_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_DI_BetterArmor_Finish_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Finish_01_00 " );	// About your armor...(wearily) They're ready!
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Finish_01_01 " );	// Here, take them. They will reliably protect you from any enemy.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor, " Bennet forged the armor and gave it to me. " );
	AI_StopProcessInfos(self);
};
