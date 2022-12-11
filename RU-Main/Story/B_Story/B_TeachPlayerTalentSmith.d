

func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	var int money;
	var int  TEMPSSBMODE ;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2 ;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4 ;
	}
	else
	{
		TEMPSSBMODE = 1 ;
	};

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	money = (cost *  75 ) /  TEMPSSBMODE ;

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);


		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return  FALSE ;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);

		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return  FALSE ;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + cost;

	if(ARMORTEACHFLAG == FALSE)
	{
		Npc_RemoveInvItems(oth,ItMi_Gold,money);
	};
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith, " In order to forge a weapon, I need a red-hot steel billet. First, I have to heat it on a furnace, and then give it the necessary shape on an anvil. For a quality weapon, some components are also needed that will give the weapon special properties. " ) ;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet( TOPIC_ARMORTEACHER , " In order to reforge armor, I first need a red-hot steel billet! Without it, I won't be able to work on the anvil... " );

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print( " Studyed forging recipe - 'Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " A self-forged steel sword does not require any additional components. " );
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " An ore sword requires one magic ore ingot to forge. " );
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Two-Handed Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " An ore two-handed sword requires one magic ore ingot to forge. " );
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print( " Learned crafting recipe - 'Long Ore Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " Long Ore Sword requires two magic ore ingots to forge. " );
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore two-handed broadsword' " );
		B_LogEntry(TOPIC_TalentSmith, " Ore two-handed broadsword requires two magic ore ingots to forge. " );
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Warblade' " );
		B_LogEntry(TOPIC_TalentSmith, " It takes three Magic Ore Ingots to forge a Combat Ore Blade. " );
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print( " Forging recipe learned - 'Ore Combat Two-Handed Blade' " );
		B_LogEntry(TOPIC_TalentSmith, " It takes three magic ore ingots to forge a Combat Ore Two-Handed Blade. " );
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print( " Learned the forging recipe - one-handed 'Dragon Slayer' " );
		B_LogEntry(TOPIC_TalentSmith, " Forging the sword 'Dragon Slayer' requires four magic ore ingots and five vials of dragon's blood. " );
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print( " Learned the forging recipe - two-handed 'Dragon Slayer' " );
		B_LogEntry(TOPIC_TalentSmith, " The Dragon Slayer Greatsword requires four Magic Ore Ingots and five Vials of Dragon Blood to forge. " );
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print( " Forging recipe learned - 'Noble Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " I can now forge a noble sword. " );
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print( " Forging recipe learned - 'Noble Longsword' " );
		B_LogEntry(TOPIC_TalentSmith, " I can now forge a noble longsword. " );
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print( " Forging recipe learned - 'Ruby Blade' " );
		B_LogEntry(TOPIC_TalentSmith, " I can even forge a ruby ​​blade now. " );
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print( " Forging recipe learned - 'El Bastardo' " );
		B_LogEntry(TOPIC_TalentSmith, " Harad taught me how to forge 'El Bastardo' - one of the best one-handed weapons! " );
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print( " Learned forging recipe - 'Militia Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade militia armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print( " Learned forging recipe - 'Heavy Militia Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy militia armor. Each reforge requires two iron ingots. " );
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print( " Forging recipe learned - 'Knight's Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a knight's armor. One ingot of magic ore is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print( " Learned forging recipe - 'Paladin Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a paladin's armor. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print( " Learned crafting recipe - 'Mercenary Light Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's light armor. One iron ingot is needed for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print( " Forging recipe learned - 'Mercenary Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print( " Learned crafting recipe - 'Heavy Mercenary Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's heavy armor. It takes three iron ingots to reforge. " );
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print( " Learned the forging recipe - 'Light Dragonslayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Light Dragonslayer Armor. Each reforge requires one magic ore ingot. " );
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print( " Learned the forging recipe - 'Dragon Slayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade dragonslayer armor. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print( " Learned forging recipe - 'Heavy Dragonslayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy dragonslayer armor. Each reforge requires three magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print( " Forging recipe learned - 'Ghost Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the ghost armor. Components for armor reforging: hot steel billet and gold ingot. " );
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print( " Forging recipe learned - 'Ghost Chainmail' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Ghost Mail. Components to reforge the armor are five Molten Steel. " );
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print( " Learned the forging recipe - 'Light Guardian Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade light guard armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print( " Forging recipe learned - 'Guard's Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the guard's armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print( " Forging recipe learned - 'Heavy Guard Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy guard armor. It takes three iron ingots to reforge. " );
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print( " Learned crafting recipe - 'Brotherhood Loincloth' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the Brotherhood of the Sleeper's loincloth. I need a reptile skin for this. " );
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print( " Learned forging recipe - 'Fraternity Guard Light Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Brotherhood Guard light armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print( " Learned forging recipe - 'Brotherhood Guard Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Brotherhood Guard armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print( " Learned the forging recipe - 'Heavy Armor of the Brotherhood Guard' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the Heavy Armor of the Brotherhood Guard. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print( " Forging recipe learned - 'Water Ring Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade 'Ring of Water' armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print( " Learned crafting recipe - 'Ore Armor of Light' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Light, I need: ten ingots of magic ore, a piece of black ore, ten pieces of sulfur, five tar solutions, five pieces of quartz, aquamarine and a piece of adamant." ) ;
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print( " Learned forging recipe - 'Dark Ore Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Darkness, I need: ten ingots of magic ore, two pieces of black ore, ten pieces of sulfur, five tar solutions, five pieces of coal, black pearl and a piece of adamant." ) ;
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentSmith_SLD(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int cost;
	var int money;
	var int  TEMPSSBMODE ;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2 ;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4 ;
	}
	else
	{
		TEMPSSBMODE = 1 ;
	};

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	money = (cost *  250 ) /  TEMPSSBMODE ;

	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);

		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return  FALSE ;
	};

	RankPoints = RankPoints + cost;

	if(ARMORTEACHFLAG == FALSE)
	{
		Npc_RemoveInvItems(oth,ItMi_Gold,money);
	};
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};

	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith, " In order to forge a weapon, I need a red-hot steel billet. First, I have to heat it on a furnace, and then give it the necessary shape on an anvil. For a quality weapon, some components are also needed that will give the weapon special properties. " ) ;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet( TOPIC_ARMORTEACHER , " In order to reforge armor, I first need a red-hot steel billet! Without it, I won't be able to work on the anvil... " );

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print( " Studyed forging recipe - 'Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " A self-forged steel sword does not require any additional components. " );
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " An ore sword requires one magic ore ingot to forge. " );
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Two-Handed Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " An ore two-handed sword requires one magic ore ingot to forge. " );
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print( " Learned crafting recipe - 'Long Ore Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " Long Ore Sword requires two magic ore ingots to forge. " );
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore two-handed broadsword' " );
		B_LogEntry(TOPIC_TalentSmith, " Ore two-handed broadsword requires two magic ore ingots to forge. " );
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Warblade' " );
		B_LogEntry(TOPIC_TalentSmith, " It takes three Magic Ore Ingots to forge a Combat Ore Blade. " );
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print( " Forging recipe learned - 'Ore Combat Two-Handed Blade' " );
		B_LogEntry(TOPIC_TalentSmith, " It takes three magic ore ingots to forge a Combat Ore Two-Handed Blade. " );
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print( " Learned the forging recipe - one-handed 'Dragon Slayer' " );
		B_LogEntry(TOPIC_TalentSmith, " Forging the sword 'Dragon Slayer' requires four magic ore ingots and five vials of dragon's blood. " );
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print( " Learned the forging recipe - two-handed 'Dragon Slayer' " );
		B_LogEntry(TOPIC_TalentSmith, " The Dragon Slayer Greatsword requires four Magic Ore Ingots and five Vials of Dragon Blood to forge. " );
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print( " Forging recipe learned - 'Noble Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " I can now forge a noble sword. " );
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print( " Forging recipe learned - 'Noble Longsword' " );
		B_LogEntry(TOPIC_TalentSmith, " I can now forge a noble longsword. " );
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print( " Forging recipe learned - 'Ruby Blade' " );
		B_LogEntry(TOPIC_TalentSmith, " I can even forge a ruby ​​blade now. " );
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print( " Forging recipe learned - 'El Bastardo' " );
		B_LogEntry(TOPIC_TalentSmith, " Harad taught me how to forge 'El Bastardo' - one of the best one-handed weapons! " );
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print( " Learned forging recipe - 'Militia Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade militia armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print( " Learned forging recipe - 'Heavy Militia Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy militia armor. Each reforge requires two iron ingots. " );
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print( " Forging recipe learned - 'Knight's Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a knight's armor. One ingot of magic ore is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print( " Learned forging recipe - 'Paladin Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a paladin's armor. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print( " Learned crafting recipe - 'Mercenary Light Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's light armor. One iron ingot is needed for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print( " Forging recipe learned - 'Mercenary Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print( " Learned crafting recipe - 'Heavy Mercenary Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's heavy armor. It takes three iron ingots to reforge. " );
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print( " Learned the forging recipe - 'Light Dragonslayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Light Dragonslayer Armor. Each reforge requires one magic ore ingot. " );
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print( " Learned the forging recipe - 'Dragon Slayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade dragonslayer armor. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print( " Learned forging recipe - 'Heavy Dragonslayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy dragonslayer armor. Each reforge requires three magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print( " Forging recipe learned - 'Ghost Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the ghost armor. Components for armor reforging: hot steel billet and gold ingot. " );
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print( " Forging recipe learned - 'Ghost Chainmail' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Ghost Mail. Components to reforge the armor are five Molten Steel. " );
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print( " Learned the forging recipe - 'Light Guardian Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade light guard armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print( " Forging recipe learned - 'Guard's Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the guard's armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print( " Forging recipe learned - 'Heavy Guard Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy guard armor. It takes three iron ingots to reforge. " );
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print( " Learned crafting recipe - 'Brotherhood Loincloth' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the Brotherhood of the Sleeper's loincloth. I need a reptile skin for this. " );
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print( " Learned forging recipe - 'Fraternity Guard Light Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Brotherhood Guard light armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print( " Learned forging recipe - 'Brotherhood Guard Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Brotherhood Guard armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print( " Learned the forging recipe - 'Heavy Armor of the Brotherhood Guard' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the Heavy Armor of the Brotherhood Guard. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print( " Forging recipe learned - 'Water Ring Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade 'Ring of Water' armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print( " Learned crafting recipe - 'Ore Armor of Light' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Light, I need: ten ingots of magic ore, a piece of black ore, ten pieces of sulfur, five tar solutions, five pieces of quartz, aquamarine and a piece of adamant." ) ;
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print( " Learned forging recipe - 'Dark Ore Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Darkness, I need: ten ingots of magic ore, two pieces of black ore, ten pieces of sulfur, five tar solutions, five pieces of coal, black pearl and a piece of adamant." ) ;
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentSmith_RemakeArmor_NoLP(var C_Npc slf,var C_Npc oth,var int waffe)
{
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};

	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith, " In order to forge a weapon, I need a red-hot steel billet. First, I have to heat it on a furnace, and then give it the necessary shape on an anvil. For a quality weapon, some components are also needed that will give the weapon special properties. " ) ;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet( TOPIC_ARMORTEACHER , " In order to reforge armor, I first need a red-hot steel billet! Without it, I won't be able to work on the anvil... " );

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print( " Studyed forging recipe - 'Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " A self-forged steel sword does not require any additional components. " );
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " An ore sword requires one magic ore ingot to forge. " );
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Two-Handed Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " An ore two-handed sword requires one magic ore ingot to forge. " );
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print( " Learned crafting recipe - 'Long Ore Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " Long Ore Sword requires two magic ore ingots to forge. " );
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore two-handed broadsword' " );
		B_LogEntry(TOPIC_TalentSmith, " Ore two-handed broadsword requires two magic ore ingots to forge. " );
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Warblade' " );
		B_LogEntry(TOPIC_TalentSmith, " It takes three Magic Ore Ingots to forge a Combat Ore Blade. " );
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print( " Forging recipe learned - 'Ore Combat Two-Handed Blade' " );
		B_LogEntry(TOPIC_TalentSmith, " It takes three magic ore ingots to forge a Combat Ore Two-Handed Blade. " );
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print( " Learned the forging recipe - one-handed 'Dragon Slayer' " );
		B_LogEntry(TOPIC_TalentSmith, " Forging the sword 'Dragon Slayer' requires four magic ore ingots and five vials of dragon's blood. " );
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print( " Learned the forging recipe - two-handed 'Dragon Slayer' " );
		B_LogEntry(TOPIC_TalentSmith, " The Dragon Slayer Greatsword requires four Magic Ore Ingots and five Vials of Dragon Blood to forge. " );
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print( " Forging recipe learned - 'Noble Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " I can now forge a noble sword. " );
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print( " Forging recipe learned - 'Noble Longsword' " );
		B_LogEntry(TOPIC_TalentSmith, " I can now forge a noble longsword. " );
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print( " Forging recipe learned - 'Ruby Blade' " );
		B_LogEntry(TOPIC_TalentSmith, " I can even forge a ruby ​​blade now. " );
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print( " Forging recipe learned - 'El Bastardo' " );
		B_LogEntry(TOPIC_TalentSmith, " Harad taught me how to forge 'El Bastardo' - one of the best one-handed weapons! " );
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print( " Learned forging recipe - 'Militia Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade militia armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print( " Learned forging recipe - 'Heavy Militia Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy militia armor. Each reforge requires two iron ingots. " );
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print( " Forging recipe learned - 'Knight's Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a knight's armor. One ingot of magic ore is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print( " Learned forging recipe - 'Paladin Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a paladin's armor. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print( " Learned crafting recipe - 'Mercenary Light Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's light armor. One iron ingot is needed for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print( " Forging recipe learned - 'Mercenary Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print( " Learned crafting recipe - 'Heavy Mercenary Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade a mercenary's heavy armor. It takes three iron ingots to reforge. " );
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print( " Learned the forging recipe - 'Light Dragonslayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Light Dragonslayer Armor. Each reforge requires one magic ore ingot. " );
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print( " Learned the forging recipe - 'Dragon Slayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade dragonslayer armor. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print( " Learned forging recipe - 'Heavy Dragonslayer Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy dragonslayer armor. Each reforge requires three magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print( " Forging recipe learned - 'Ghost Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the ghost armor. Components for armor reforging: hot steel billet and gold ingot. " );
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print( " Forging recipe learned - 'Ghost Chainmail' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Ghost Mail. Components to reforge the armor are five Molten Steel. " );
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print( " Learned the forging recipe - 'Light Guardian Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade light guard armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print( " Forging recipe learned - 'Guard's Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the guard's armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print( " Forging recipe learned - 'Heavy Guard Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade heavy guard armor. It takes three iron ingots to reforge. " );
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print( " Learned crafting recipe - 'Brotherhood Loincloth' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the Brotherhood of the Sleeper's loincloth. I need a reptile skin for this. " );
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print( " Learned forging recipe - 'Fraternity Guard Light Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Brotherhood Guard light armor. One iron ingot is required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print( " Learned forging recipe - 'Brotherhood Guard Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade Brotherhood Guard armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print( " Learned the forging recipe - 'Heavy Armor of the Brotherhood Guard' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade the Heavy Armor of the Brotherhood Guard. Each reforge requires two magic ore ingots. " );
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print( " Forging recipe learned - 'Water Ring Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " Now I know how to upgrade 'Ring of Water' armor. Two iron ingots are required for each reforging. " );
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print( " Learned crafting recipe - 'Ore Armor of Light' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Light, I need: ten ingots of magic ore, a piece of black ore, ten pieces of sulfur, five tar solutions, five pieces of quartz, aquamarine and a piece of adamant." ) ;
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print( " Learned forging recipe - 'Dark Ore Armor' " );
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Darkness, I need: ten ingots of magic ore, two pieces of black ore, ten pieces of sulfur, five tar solutions, five pieces of coal, black pearl and a piece of adamant." ) ;
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};
