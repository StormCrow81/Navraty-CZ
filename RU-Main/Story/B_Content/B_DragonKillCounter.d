

var int SwapDragnIsDead;
var int RckDragnIsDead;
var int FreDragnIsDead;
var int IcDragnIsDead;
be int redragnisdead;
var int sighdead;

func int B_DragonKillCounter(var C_Npc current_dragon)
{
	was C_Npc Raven;
	var C_Npc Ravd;
	var C_Npc SwapDragn;
	var C_Npc RckDragn;
	var C_Npc FreDragn;
	var C_Npc IcDragn;
	where C_Npc blkdragn;
	var C_Npc reddragn;
	var C_Npc urgrom;
	var C_Npc supported;

	Raven = Hlp_GetNpc(BDT_1090_Addon_Raven);

	if (Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(Raven))
	{
		if(RavenIsDead == FALSE)
		{
			PlayVideoEx("EXTRO_RAVEN.BIK",TRUE,FALSE);
			RavenIsDead = TRUE;
			B_RemoveNpc(Myxir_ADW);
			MyxirAway = TRUE;
		};
	};

	Ravd = Hlp_GetNpc(BDT_2090_Addon_Raven);

	if(Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(Ravd))
	{
		if(RavenIsDead == FALSE)
		{
			PlayVideoEx("EXTRO_RAVEN.BIK",TRUE,FALSE);
			RavenIsDead = TRUE;
			B_LogEntry_Quiet(TOPIC_AdanosCrone, " I was able to defeat the great evil in the temple! It seems that the Raven himself also perished with him in the arms of Beliar himself. It's time to return to Saturas and tell him about everything." ) ;
			Wld_SendTrigger("EVT_TELEPORT_TO_RESTART");
			Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_MAIN_01");
		};
	};
	if(current_dragon.guild == GIL_DRAGON)
	{
		SwapDragn = Hlp_GetNpc(Dragon_Swamp);
		RckDragn = Hlp_GetNpc(Dragon_Rock);
		FreDragn = Hlp_GetNpc(Dragon_Fire);
		IcDragn = Hlp_GetNpc(Dragon_Ice);
		blkdragn = Hlp_GetNpc(dragon_black);
		reddragn = Hlp_GetNpc(Dragon_Fire_Island);

		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(SwapDragn)) && (SwapDragnIsDead == FALSE))
		{
			MIS_KilledDragons = MIS_KilledDragons + 1;
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			SwapDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(RckDragn)) && (RckDragnIsDead == FALSE))
		{
			Wld_SendTrigger("STONEDRAGON_GATE");
			MIS_KilledDragons = MIS_KilledDragons + 1;
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			RckDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(FreDragn)) && (FreDragnIsDead == FALSE))
		{
			Wld_SendTrigger("FIREDRAGON_GATE");
			MIS_KilledDragons = MIS_KilledDragons + 1;
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			FreDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(IcDragn)) && (IcDragnIsDead == FALSE))
		{
			MIS_KilledDragons = MIS_KilledDragons + 1;
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			IcDragnIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(reddragn)) && (REDDRAGNISDEAD == FALSE))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			REDDRAGNISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(blkdragn)) && (BLKDRAGNISDEAD == FALSE))
		{
			BLKDRAGNISDEAD = TRUE;
			B_LogEntry( TOPIC_URNAZULRAGE , " The once mighty black dragon Azgalor is dead! Now I have to take his heart to Ur-Thrall as proof. " );
			B_RemoveNpc(orc_8563_urgrom);
			Wld_InsertNpc(orc_8565_urgrom,"FP_STAND_URGROM");
			Wld_SetTime( 6 , 0 );
		};
	};
	if(MIS_KilledDragons == 4)
	{
		MIS_AllDragonsDead = TRUE;

		if((DJG_BiffParty == TRUE) && (Npc_IsDead(Biff) == FALSE))
		{
			DJG_BiffSurvivedLastDragon = TRUE;
		};
	};
	if(current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 25;
		UndeadDragonIsDead = TRUE;
		Log_CreateTopic(TOPIC_BackToShip,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BackToShip,LOG_Running);
		B_LogEntry(TOPIC_BackToShip,PRINT_DragKillCount);
		PlayVideoEx("RET2_Extro_Oth.BIK",TRUE,FALSE);
	};

	return TRUE;
};

