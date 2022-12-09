

func void B_AssignSchiffswachenGuard(var C_Npc Schiffswache)
{
	if((MIS_ShipIsFree == TRUE) || (MIS_SCvisitShip == LOG_Running))
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_Ambient_04_00 " );	// We're watching you. Remember this.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_Ambient_09_01 " );	// Don't make trouble here, okay?
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_Ambient_12_02 " );	// And don't think of stealing anything, okay?
		};
		AI_StopProcessInfos(Schiffswache);
		Npc_SetRefuseTalk(Schiffswache,60);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,60);
	}
	else 	if (Wld_IsTime( 7 , 0 , 9 , 30 ) || Wld_IsTime( 18 , 0 , 20 , 30 ))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,20);
	}
	else
	{
		B_Say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,1);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,20);
	};
};

func void B_AssignShip GuardInfo(var C_Npc Ship Guard)
{
	if(MIS_OCGateOpen == TRUE)
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_AmbientKap5_04_00 " );	// Those damned orcs are storming Castle Garonda. We must act immediately.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_AmbientKap5_09_01 " );	// If we could find this traitor who opened the main gate of the castle, we would show him!
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_AmbientKap5_12_02 " );	// We can't wait any longer. Our boys in the Vale of Mines need help to deal with the next wave of orcs.
		};
	}
	else
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_AmbientKap5_04_03 " );	// Lord Hagen has declared a general mobilization! Soon we will set out for the Valley of Mines.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_AmbientKap5_09_04 " );	// Orcs need to be taught a lesson.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other, " DIA_Pal_Schiffswache_AmbientKap5_12_05 " );	// I can't wait to finally show these orcs. Well, nothing, we will soon begin to crowd them.
		};
	};
	AI_StopProcessInfos(Schiffswache);
};

func void B_AssignSchiffswachenTalk(var C_Npc Schiffswache)
{
	if (Chapter >=  5 )
	{
		B_AssignShip GuardsInfo(Ship Guard);
	}
	else
	{
		B_AssignSchiffswachenGuard(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions(var C_Npc Schiffswache)
{
	if((Kapitel < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCvisitShip != LOG_Running) && (Npc_IsInState(self,ZS_Stand_Plaz) == FALSE))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

