

instance SPELL_WATERWALL(C_Spell_Proto)
{
	time_per_mana = 0 ;
	damage_per_level = 10;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	damagetype = DAM_MAGIC;
};

func int spell_logic_waterwall(var int manaInvested)
{
	if(Npc_IsPlayer(self) && (MoraUlartuIsOn[1] == TRUE))
	{
		return SPL_SENDSTOP;
	};
	if(self.attribute[ATR_MANA] >= 50)
	{
		return SPL_SENDCAST;
	};

	return SPL_SENDSTOP;
};

func void spell_cast_waterwall()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike Pyrocar and other mages, I can use rune magic. What does that mean?! " );
		}
		else
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike Pyrocar, I can use rune magic. What does that mean?! " );
		};
		TESTRUNEME = TRUE ;
	};
	if(Npc_IsPlayer(self) && (MoraUlartuIsOn[1] == FALSE))
	{
		MoraUlartuIsOn[1] = TRUE;
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		AI_Print(PRINT_SoulHunter);
		Snd_Play("LevelUP");
		KNOWSHOWDEALSOULS = TRUE;
		Log_CreateTopic(TOPIC_SUPERBELIARWEAPON_UPG,LOG_NOTE);
		B_LogEntry_Quiet( TOPIC_SUPERBELIARWEAPON_UPG , " The Mora Ulartu rune I received gave me the Soul Catcher ability, with which I can capture and enslave the soul of any creature. I can present the collected souls as a gift to the Dark God, not forgetting to entreat him for a boon, of course. " );
	};

	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 50;
	self.aivar[AIV_SelectSpell] +=  1 ;
};

