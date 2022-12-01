

instance Spell_PalDestroyEvil(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalDestroyEvil;
	spellType = SPELL_NEUTRAL;
	targetCollectRange = 1600;
};


func int Spell_Logic_PalDestroyEvil(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_PalDestroyEvil)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_PAL)
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

func void Spell_Cast_PalDestroyEvil()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalDestroyEvil;
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

