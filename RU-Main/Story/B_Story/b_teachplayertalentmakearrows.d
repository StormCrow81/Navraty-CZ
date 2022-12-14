

func int b_teachplayertalentmakearrows(var C_Npc slf,var C_Npc oth,var int talent)
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

	kosten = B_GetLearnCostTalent(oth,talent,1);
	money = (cost *  100 ) /  TEMPSSBMODE ;

	if(talent != NPC_TALENT_MAKEARROWS)
	{
		Print("*** ERROR: Wrong Parameter ***");
		return  FALSE ;
	};
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

	if(talent == NPC_TALENT_MAKEARROWS)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_MAKEARROWS,1);
		AI_Print( " Studied crafting recipe - 'Regular arrows and bolts' " );
		KNOWHOWTOMAKEARROWS = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
		B_LogEntry( TOPIC_TALENTMAKEARROWS , " Now I can make arrows and bolts myself. To do this, I need to have: a saw, for making wood blanks from a log; tongs, for making a bow shaft from blanks on a carpentry machine; a steel billet, for making a steel tip on an anvil .After that, I need a prefabricated table to make arrows or bolts on it. " );
		return TRUE;
	};
	return  FALSE ;
};

