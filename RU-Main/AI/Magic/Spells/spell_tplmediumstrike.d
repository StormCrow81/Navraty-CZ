

instance SPELL_TPLMEDIUMSTRIKE(C_Spell_Proto)
{
	time_per_mana = 0 ;
	damage_per_level = SPL_DAMAGE_TPLMEDIUMSTRIKE;
	damagetype = DAM_MAGIC;
	targetCollectRange = 1200;
};


func int spell_logic_tplmediumstrike(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TPLMEDIUMSTRIKE)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_TPL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_tplmediumstrike()
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
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TPLMEDIUMSTRIKE;
	self.aivar[AIV_SelectSpell] +=  1 ;
};

