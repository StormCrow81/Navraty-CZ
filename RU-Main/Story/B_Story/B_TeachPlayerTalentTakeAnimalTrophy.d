

func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
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
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy, " Now I can: " );

	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Pull out teeth and fangs' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...pull out teeth and fangs. " );
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Break claws' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...break claws. " );
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Skinning' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...skin. " );
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		AI_Print( " Learned butchering skill - 'Flay Reptiles' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ... skinning reptiles. " );
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		AI_Print( " Learned the skill of butchering the prey - 'Cut out the heart' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...carve hearts from golems and demons. " );
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		AI_Print( " Learned the skill of butchering the prey - 'Break off the horn of the obscurantists' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...break off the horns of the Aurors. " );
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Cut fire tongue' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut fire tongue from fire lizards. " );
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Cut Wings' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut off blood hornets' wings. " );
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print( " Learned the skill of cutting prey - 'Cut the sting' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut the stingers off the blood hornets. " );
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		AI_Print( " Learned the skill of cutting prey - 'Cut mandibles' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...carve the mandible from creepers, field beetles, and spiders. " );
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Remove shells' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...remove shells from sliders. " );
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Break the horn of snappers' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...break the horn of dragon snappers. " );
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Remove dragon scales' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...scaling dragons. " );
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		AI_Print( " Learned butchering skill - 'Pump Dragon's Blood' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...pump blood from dragons. " );
	};

	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentTakeAnimalTrophyOrc(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int cost;

	kosten = B_GetLearnCostTalentOrc(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return  FALSE ;
	};

	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy, " Now I can: " );

	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Pull out teeth and fangs' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...pull out teeth and fangs. " );
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Break claws' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...break claws. " );
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Skinning' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...skin. " );
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		AI_Print( " Learned butchering skill - 'Flay Reptiles' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ... skinning reptiles. " );
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		AI_Print( " Learned the skill of butchering the prey - 'Cut out the heart' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...carve hearts from golems and demons. " );
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		AI_Print( " Learned the skill of butchering the prey - 'Break off the horn of the obscurantists' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...break off the horns of the Aurors. " );
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Cut fire tongue' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut fire tongue from fire lizards. " );
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Cut Wings' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut off blood hornets' wings. " );
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print( " Learned the skill of cutting prey - 'Cut the sting' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut the stingers off the blood hornets. " );
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		AI_Print( " Learned the skill of cutting prey - 'Cut mandibles' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...carve the mandible from creepers, field beetles, and spiders. " );
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Remove shells' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...remove shells from sliders. " );
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Break the horn of snappers' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...break the horn of dragon snappers. " );
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		AI_Print( " Learned the skill of butchering prey - 'Remove dragon scales' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...scaling dragons. " );
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		AI_Print( " Learned butchering skill - 'Pump Dragon's Blood' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...pump blood from dragons. " );
	};

	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	return TRUE;
};

