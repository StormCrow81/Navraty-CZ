

instance Spell_ChargeFireball(C_Spell_Proto)
{
	time_per_mana = 60 ;
	damage_per_level = SPL_Damage_ChargeFireball;
	damagetype = DAM_FIRE;
	canTurnDuringInvest = TRUE ;
};


func int Spell_Logic_ChargeFireball(var int manaInvested)
{
	if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
	{
		AI_PrintClr( " This won't work... " , 177 , 58 , 17 );
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(self.attribute[ATR_MANA] < STEP_ChargeFireball)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (STEP_ChargeFireball * 1))
	{
		self.aivar[AIV_SpellLevel] = 1 ;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manaInvested > (STEP_ChargeFireball * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeFireball;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 2 ;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeFireball * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeFireball;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 3 ;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeFireball * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeFireball;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 4 ;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeFireball * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_ChargeFireball(var int spellLevel)
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeFireball;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
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
	self.aivar[AIV_SelectSpell] +=  1 ;
};

