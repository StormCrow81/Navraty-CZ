

func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int potion)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,potion);
	money = (cost *  75 ) /  TEMPSSBMODE ;

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return  FALSE ;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		return  FALSE ;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + cost;
	Npc_RemoveInvItems(oth,ItMi_Gold,money);
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy, " To make an alchemy potion, I definitely need an alchemy vessel and different ingredients depending on what kind of potion I want to make. " );

	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_00 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Healing Essence' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Healing Essence' drink are pure alcohol, medicinal herb and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_01 = TRUE;
		AI_Print( " Alchemy recipe studied - 'Healing Extract' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Healing Extract Ingredients: Pure Alcohol, Medicinal Herb and Seraphim. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_02 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Healing Elixir' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Healing Elixir Ingredients: Pure Alcohol, Healing Root and Seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_03 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Mana Essence' " );
		B_LogEntry(TOPIC_TalentAlchemy, " The ingredients for the 'Essence of Mana' drink are pure alcohol, fire nettle and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_04 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Mana Extract' " );
		B_LogEntry(TOPIC_TalentAlchemy, " The ingredients for the 'Mana Extract' drink are pure alcohol, fire grass, and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_05 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Mana' " );
		B_LogEntry(TOPIC_TalentAlchemy, " The ingredients for the 'Elixir of Mana' drink are pure alcohol, fireroot and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		PLAYER_TALENT_ALCHEMY_06 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Haste' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Drink of Haste': Pure Alcohol, Glorcha Grass and Meadow Knotweed. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_SPEED_02)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		PLAYER_TALENT_ALCHEMY_15 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Double Acceleration' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Double Boost Drink': Pure Alcohol, Glorcha Herb, and Haste Drink. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[17] = TRUE;
		PLAYER_TALENT_ALCHEMY_17 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Endurance' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Drink of Stamina': pure alcohol, seraphis and meadow knotweed. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_PERM_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[18] = TRUE;
		PLAYER_TALENT_ALCHEMY_18 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Endurance' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Elixir of Stamina' drink are pure alcohol, troll cherries and king sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		PLAYER_TALENT_ALCHEMY_07 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Power' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Elixir of Strength' drink are pure alcohol, dragon root and royal sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		PLAYER_TALENT_ALCHEMY_08 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Agility' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the drink 'Elixir of Agility': pure alcohol, goblin berry and royal sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		PLAYER_TALENT_ALCHEMY_09 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Spirit Elixir' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for Spirit Elixir: pure alcohol, fireroot and king sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		PLAYER_TALENT_ALCHEMY_10 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Life' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Elixir of Life' drink: pure alcohol, three medicinal roots and meadow knotweed. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_PERM_SUPERMANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		PLAYER_TALENT_ALCHEMY_16 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Amun-Su' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Drink of Amun-Su' potion are fire root, skeletal bone, aquamarine, black pearl, fire tongue, bogweed, creeper mandible, stone golem heart, creeper egg, and king sorrel." ) ;

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};

	if(TalentCount_Alchemy[0] > 100)
	{
		TalentCount_Alchemy[0] = 100;
	};
	if(TalentCount_Alchemy[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,4);
	}
	else if(TalentCount_Alchemy[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,3);
	}
	else if(TalentCount_Alchemy[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_ALCHEMY,TalentCount_Alchemy[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int b_teachplayertalentalchemy_free(var C_Npc slf,var C_Npc oth,var int potion)
{
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy, " To make an alchemy potion, I definitely need an alchemy vessel and different ingredients depending on what kind of potion I want to make. " );

	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_00 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Healing Essence' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Healing Essence' drink are pure alcohol, medicinal herb and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_01 = TRUE;
		AI_Print( " Alchemy recipe studied - 'Healing Extract' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Healing Extract Ingredients: Pure Alcohol, Medicinal Herb and Seraphim. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_02 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Healing Elixir' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Healing Elixir Ingredients: Pure Alcohol, Healing Root and Seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_03 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Mana Essence' " );
		B_LogEntry(TOPIC_TalentAlchemy, " The ingredients for the 'Essence of Mana' drink are pure alcohol, fire nettle and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_04 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Mana Extract' " );
		B_LogEntry(TOPIC_TalentAlchemy, " The ingredients for the 'Mana Extract' drink are pure alcohol, fire grass, and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_05 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Mana' " );
		B_LogEntry(TOPIC_TalentAlchemy, " The ingredients for the 'Elixir of Mana' drink are pure alcohol, fireroot and seraph. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		PLAYER_TALENT_ALCHEMY_06 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Haste' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Drink of Haste': Pure Alcohol, Glorcha Grass and Meadow Knotweed. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_SPEED_02)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		PLAYER_TALENT_ALCHEMY_15 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Double Acceleration' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Double Boost Drink': Pure Alcohol, Glorcha Herb, and Haste Drink. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[17] = TRUE;
		PLAYER_TALENT_ALCHEMY_17 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Endurance' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for 'Drink of Stamina': pure alcohol, seraphis and meadow knotweed. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_PERM_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[18] = TRUE;
		PLAYER_TALENT_ALCHEMY_18 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Endurance' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Elixir of Stamina' drink are pure alcohol, troll cherries and king sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		PLAYER_TALENT_ALCHEMY_07 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Power' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Elixir of Strength' drink are pure alcohol, dragon root and royal sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		PLAYER_TALENT_ALCHEMY_08 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Agility' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the drink 'Elixir of Agility': pure alcohol, goblin berry and royal sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		PLAYER_TALENT_ALCHEMY_09 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Spirit Elixir' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for Spirit Elixir: pure alcohol, fireroot and king sorrel. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		PLAYER_TALENT_ALCHEMY_10 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Elixir of Life' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Elixir of Life' drink: pure alcohol, three medicinal roots and meadow knotweed. " );

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};
	if(potion == POTION_PERM_SUPERMANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		PLAYER_TALENT_ALCHEMY_16 = TRUE;
		AI_Print( " Alchemy recipe learned - 'Drink of Amun-Su' " );
		B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for the 'Drink of Amun-Su' potion are fire root, skeletal bone, aquamarine, black pearl, fire tongue, bogweed, creeper mandible, stone golem heart, creeper egg, and king sorrel." ) ;

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	};

	if(TalentCount_Alchemy[0] > 100)
	{
		TalentCount_Alchemy[0] = 100;
	};
	if(TalentCount_Alchemy[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,4);
	}
	else if(TalentCount_Alchemy[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,3);
	}
	else if(TalentCount_Alchemy[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_ALCHEMY,TalentCount_Alchemy[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};
