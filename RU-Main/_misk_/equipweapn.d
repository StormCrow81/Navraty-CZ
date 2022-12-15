
var C_Item EQUIPWEAPN;

func void B_PrintTeleportTooFarAway(var int level)
{
	if(level != CurrentLevel)
	{
		AI_Print(PRINT_TeleportTooFarAway);
		B_Say(self,self,"$DONTWORK");
	};
};

//---------------логика телепортов-----------------------------

instance Spell_Teleport(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};

instance Spell_teleportorc(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_GOOD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

// ---------------Quest runes-----------------------

func int Spell_Logic_PalTeleportSecret(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_PalTeleportSecret()
{
	B_PrintTeleportTooFarAway( NEWWORLD_ZEN );
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike Pyrocar and other mages, I can use rune magic. What does that mean?! " );
		}
		else
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike the Pyrocar, I can use rune magic. What does that mean?! " );
		};
		TESTRUNEME = TRUE ;
	};
	AI_Teleport(self,"NW_PAL_SECRETCHAMBER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int Spell_Logic_TeleportMonastery(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportMonastery()
{
	B_PrintTeleportTooFarAway( NEWWORLD_ZEN );
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	if(self.id != 0)
	{
		AI_Teleport(self,"KLOSTER");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	};
};

func int spell_logic_teleportdagot(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportdagot()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_IsPlayer(self))
	{
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
			}
			else
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
			};
			AI_Teleport(hero,"NW_GUARDIANS_CHAMBER");
			AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		}
		else if(CurrentLevel == DRAGONISLAND_ZEN)
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
			}
			else
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
			};
			AI_Teleport(hero,"WP_UNDEAD_CENTER_01");
			AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		}
		else
		{
			AI_Print(PRINT_TeleportTooFarAway);
		};
	}
	else
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		};
		AI_Teleport(self,"TOT");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike Pyrocar and other mages, I can use rune magic. What does that mean?! " );
		}
		else
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike the Pyrocar, I can use rune magic. What does that mean?! " );
		};
		TESTRUNEME = TRUE ;
	};
};

func int spell_logic_teleportorc(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void spell_cast_teleportorc()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		AI_Teleport(self,"OW_ORCCITY_ENTRANCE");
	}
	else if(CurrentLevel == ORCCITY_ZEN)
	{
		AI_Teleport(self,"ORC_CITY_21");
	}
	else if(CurrentLevel == ORCOREMINE_ZEN)
	{
		AI_Teleport(self,"OM_LEVEL_03_WAY_UP_10");
	}
	else if(CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if(ORCTELEPORTSTATUS == FALSE)
		{
			AI_Teleport(self, " GRYD_072 " );
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
			ORCTELEPORTSTATUS = TRUE;
		}
		else if(ORCTELEPORTSTATUS == TRUE)
		{
			AI_Teleport(self, " GRYD_060 " );
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
			ORCTELEPORTSTATUS = FALSE;
		};
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike Pyrocar and other mages, I can use rune magic. What does that mean?! " );
		}
		else
		{
			B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " How interesting! Unlike the Pyrocar, I can use rune magic. What does that mean?! " );
		};

		TESTRUNEME = TRUE ;
	};
};

// ----------------------old runes------------------------ -----------------

func int Spell_Logic_TeleportFarm(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportFarm()
{
};

func int Spell_Logic_TeleportPassNW(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportPassNW()
{
};

func int Spell_Logic_TeleportPassOW(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportPassOW()
{
};

func int Spell_Logic_TeleportOC(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportOC()
{
};

func int Spell_Logic_TeleportOWDemonTower(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportOWDemonTower()
{
};

func int Spell_Logic_TeleportTaverne(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportTaverne()
{
};

func int spell_logic_teleportpsicamp(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void spell_cast_teleportpsicamp()
{
};


// ----------------new system------------------------------ ------------------

func int Spell_Logic_TeleportXardas(var int manaInvested)
{
	if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
	{
		B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return SPL_SENDSTOP;
	};
	if ((Chapter >=  3 ) && (MeetDarkRavenSpeaker ==  FALSE ) && (CurrentLevel ==  NEWWORLD_ZEN ))
	{
		Print ( " Something is preventing me from doing this... " );
		B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};

	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportXardas()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if ((Chapter >=  3 ) && (MeetDarkRavenSpeaker ==  FALSE ) && (CurrentLevel ==  NEWWORLD_ZEN ))
	{
	}
	else
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		};
		if(self.id == 0)
		{
			TeleportCheck = TRUE;
			AI_ProcessInfos(self);
		};
	};
};

func void Spell_Cast_Teleport()
{
	if(Npc_GetActiveSpell(self) == SPL_PalTeleportSecret)
	{
		Spell_Cast_PalTeleportSecret();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportSeaport)
	{
		Spell_Cast_TeleportSeaport();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportMonastery)
	{
		Spell_Cast_TeleportMonastery();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportFarm)
	{
		Spell_Cast_TeleportFarm();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportXardas)
	{
		Spell_Cast_TeleportXardas();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassNW)
	{
		Spell_Cast_TeleportPassNW();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassOW)
	{
		Spell_Cast_TeleportPassOW();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOC)
	{
		Spell_Cast_TeleportOC();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)
	{
		Spell_Cast_TeleportOWDemonTower();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTDAGOT)
	{
		spell_cast_teleportdagot();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTORC)
	{
		spell_cast_teleportorc();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPSICAMP)
	{
		spell_cast_teleportpsicamp();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportTaverne)
	{
		Spell_Cast_TeleportTaverne();
	};
};

instance PC_TELEPORT_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_TELEPORT_end_condition;
	information = PC_TELEPORT_end_info;
	permanent = TRUE;
	description = " (...close) " ;
};

func int PC_TELEPORT_end_condition()
{
	if(TeleportCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_TELEPORT_end_info()
{
	TeleportCheck = FALSE;
	AI_StopProcessInfos(self);
};

instance PC_TELEPORTLOCATION_ON(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_TELEPORTLOCATION_ON_condition;
	information = PC_TELEPORTLOCATION_ON_info;
	permanent = TRUE;
	description = " Teleport to another part of the island (Requires: 40 magical energy) " ;
};

func int PC_TELEPORTLOCATION_ON_condition()
{
	if(TeleportCheck == TRUE)
	{
		if((MeetDarkRavenSpeaker == FALSE) && (MIS_ReadyForChapter3 == TRUE))
		{
			return  FALSE ;
		}
		else
		{
			return TRUE;
		};
	};
};

func void PC_TELEPORTLOCATION_ON_info()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if ((CurrentLevel !=  NEWWORLD_ZEN ) && (CurrentLevel !=  ITUSELDTOWER_ZEN ) && (CurrentLevel !=  LOSTVALLEY_ZEN ) && (CurrentLevel !=  DRAGONTEMPLE_ZEN ) && (CurrentLevel !=  HAOSWORLD_ZEN ) && (CurrentLevel ! =  HAOSWORLD ! = Level_ORZEN ) && && ( CurrentLevel != DRAGON_LAND_ZEN ) && (CurrentLevel   != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((VINOCAVE_TP == TRUE) || (SAGITTA_TP == TRUE) || (SUNCIRCLE_TP == TRUE) || (BLACKTROLL_TP == TRUE) || (ADWRUINS_TP == TRUE) || (PSI_TP == TRUE) || (HUNT_TP == TRUE) || (TAVERNE_TP == TRUE) || (PASSOW_TP == TRUE) || (KLOSTER_TP == TRUE) || (BIGFARM_TP == TRUE) || (TOWN_TP == TRUE) || (XARDAS_TP == TRUE))
		{
			Info_AddChoice( PC_TELEPORTLOCATION_ON , " ... in Horinis " , PC_TELEPORTLOCATION_ON_HOR );			
		};
	};
	if((CurrentLevel != ADDONWORLD_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((ADW_TP == TRUE) || (PIRATCAMP_TP == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"...в Яркендар",PC_TELEPORTLOCATION_ON_ADW);			
		};
	};
	if((CurrentLevel != OLDWORLD_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((SKLEP_TP == TRUE) || (PASSNW_TP == TRUE) || (OLDPSI_TP == TRUE) || (OLDFORT_TP == TRUE) || (DARKTOWER_TP == TRUE) || (ICE_TP == TRUE) || (NETBEK_TP == TRUE) || (CASTLE_TP == TRUE))
		{
			Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to Mining Valley " , PC_TELEPORTLOCATION_ON_OW );			
		};
	};
	if((CurrentLevel != ADANOSVALLEY_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((COMPLEX_TP == TRUE) || (LIFECIRCLE_TP == TRUE) || (PASSAV_TP == TRUE) || (PYRAMIDE_TP == TRUE) || (TEARHRAM_TP == TRUE))
		{
			Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...on the Plateau of the Ancients " , PC_TELEPORTLOCATION_ON_AV );			
		};
	};	
	if ((CurrentLevel !=  ORCMOUNTAIN_ZEN ) && (CurrentLevel !=  ITUSELDTOWER_ZEN ) && (CurrentLevel !=  LOSTVALLEY_ZEN ) && (CurrentLevel !=  DRAGONTEMPLE_ZEN ) && (CurrentLevel !=  PASHALWORLD_ZEN ) && (CurrentLevel !=  HAOSWORLD_ZEN ) && (CurrentLevel !=  PRIORATWORLD_ZEN ) && ( CurrentLevel !=  DRAGON_LAND_ZEN ) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if(ORCMOUNTAIN_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the orc mountains " , PC_TELEPORTLOCATION_ON_ORM );			
		};
	};	

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_BACK()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);
};

func void PC_TELEPORTLOCATION_ON_ADW()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(ADW_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the hermitage " , PC_TELEPORTLOCATION_ON_OLDHOUSE );
	};
	if(PIRATCAMP_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the pirate camp " , PC_TELEPORTLOCATION_ON_PIRATCAMP );
	};

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_HOR()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(VINOCAVE_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the western forest " , PC_TELEPORTLOCATION_ON_VINOCAVE );
	};
	if ( ARROW_TP  ==  TRUE )
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...sagitta's cave " , PC_TELEPORTLOCATION_ON_SAGITTA );
	};
	if(SUNCIRCLE_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...circle of the Sun " , PC_TELEPORTLOCATION_ON_SUNCIRCLE );
	};
	if(BLACKTROLL_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the black troll's lair " , PC_TELEPORTLOCATION_ON_BLACKTROLL );
	};
	if(ADWRUINS_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...Water Mage Dig Site " , PC_TELEPORTLOCATION_ON_ADWRUINS );
	};
	if(PSI_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the Brotherhood camp " , PC_TELEPORTLOCATION_ON_PSI );
	};
	if(HUNT_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...hunter camp " , PC_TELEPORTLOCATION_ON_HUNT );
	};
	if(TAVERNE_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...Dead Harpy Tavern " , PC_TELEPORTLOCATION_ON_TAVERNE );
	};
	if(PASSOW_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...pass to Mining Valley " , PC_TELEPORTLOCATION_ON_PASSOW );
	};
	if(KLOSTER_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...Innos Monastery " , PC_TELEPORTLOCATION_ON_KLOSTER );
	};
	if(BIGFARM_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"...ферме Онара",PC_TELEPORTLOCATION_ON_BIGFARM);
	};
	if(TOWN_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...east gate of the city of Khorinis " , PC_TELEPORTLOCATION_ON_TOWN );
	};
	if(XARDAS_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...xardas tower " , PC_TELEPORTLOCATION_ON_XARDAS );
	};

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_OW()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(SKLEP_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to an abandoned crypt " , PC_TELEPORTLOCATION_ON_SKLEP );
	};
	if(OLDPSI_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the Brotherhood of the Sleeper camp " , PC_TELEPORTLOCATION_ON_OLDPSI );
	};
	if(OLDFORT_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...destroyed fort " , PC_TELEPORTLOCATION_ON_OLDFORT );
	};
	if(DARKTOWER_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the old tower of Xardas " , PC_TELEPORTLOCATION_ON_DARKTOWER );
	};
	if(ICE_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...passing to New Camp " , PC_TELEPORTLOCATION_ON_ICE );
	};
	if(NETBEK_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the ruined monastery " , PC_TELEPORTLOCATION_ON_NETBEK );
	};
	if(PASSNW_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...passage in Horinis " , PC_TELEPORTLOCATION_ON_PASSNW );
	};
	if(CASTLE_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to the Ore Barons ' Castle " , PC_TELEPORTLOCATION_ON_CASTLE );
	};

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void  PC_TELEPORTLOCATION_ON_AV ()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(COMPLEX_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...temple square " , PC_TELEPORTLOCATION_ON_COMPLEX );
	};
	if(LIFECIRCLE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"...Кругу Жизни",PC_TELEPORTLOCATION_ON_LIFECIRCLE);
	};
	if(PASSAV_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...passage to the plateau of the Ancients " , PC_TELEPORTLOCATION_ON_PASSAV );
	};
	if(PYRAMIDE_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...To the Temple of Truth " , PC_TELEPORTLOCATION_ON_PYRAMIDE );
	};
	if(TEARHRAM_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...To the Altar of Tears " , PC_TELEPORTLOCATION_ON_TEARHRAM );
	};

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_ORM()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(ORCMOUNTAIN_TP == TRUE)
	{
		Info_AddChoice( PC_TELEPORTLOCATION_ON , " ...to runestone " , PC_TELEPORTLOCATION_ON_ORCMOUNTAIN );
	};

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_OLDHOUSE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADW_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PIRATCAMP()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PIRATCAMP_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ORCMOUNTAIN()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ORCMOUNTAIN_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_XARDAS()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	LOC_XARDAS_TP_OK = TRUE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_XARDAS_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_TOWN()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_TOWN_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_TAVERNE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_TAVERNE_TP_OK = TRUE ;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PSI()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PSI_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PASSOW()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PASSOW_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_BIGFARM()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_BIGFARM_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_KLOSTER()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_KLOSTER_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void  PC_TELEPORTLOCATION_ON_ARROW ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ARROW_TP_OK = TRUE ;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_HUNT()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_HUNT_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_VINOCAVE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	LOC_VINOCAVE_TP_OK = TRUE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_VINOCAVE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SUNCIRCLE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SUNCIRCLE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ADWRUINS()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADWRUINS_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_BLACKTROLL()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_BLACKTROLL_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_CASTLE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_CASTLE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ICE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ICE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SKLEP()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SKLEP_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_DARKTOWER()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_DARKTOWER_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OLDFORT()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OLDFORT_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OLDPSI()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OLDPSI_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 4040 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_NETBEK()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_NETBEK_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PASSNW()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PASSNW_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_TEARHRAM()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_TEARHRAM_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PYRAMIDE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PYRAMIDE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PASSAV()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PASSAV_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_LIFECIRCLE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_LIFECIRCLE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_COMPLEX()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_COMPLEX_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings( " Missing " ,IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText, " magical energy... " );
		AI_PrintClr(concatText,177,58,17);
	};
};

instance PC_TELEPORT_ON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_TELEPORT_ON_condition;
	information = PC_TELEPORT_ON_info;
	permanent = TRUE;
	description = " Teleport to... " ;
};

func int PC_TELEPORT_ON_condition()
{
	if(TeleportCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_TELEPORT_ON_info()
{
	Info_ClearChoices(PC_TELEPORT_ON);

	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(VINOCAVE_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the western forest " , PC_TELEPORT_ON_VINOCAVE );
		};
		if ( ARROW_TP  ==  TRUE )
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...sagitta's cave " , PC_TELEPORT_ON_SAGITTA );
		};
		if(SUNCIRCLE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"...кругу Солнца",PC_TELEPORT_ON_SUNCIRCLE);
		};
		if(BLACKTROLL_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the black troll's lair " , PC_TELEPORT_ON_BLACKTROLL );
		};
		if(ADWRUINS_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...Water Mage dig " , PC_TELEPORT_ON_ADWRUINS );
		};
		if(PSI_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...Fraternity Camp " , PC_TELEPORT_ON_PSI );
		};
		if(HUNT_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...hunter camp " , PC_TELEPORT_ON_HUNT );
		};
		if(TAVERNE_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...Dead Harpy Tavern " , PC_TELEPORT_ON_TAVERNE );
		};
		if(PASSOW_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...pass to Mining Valley " , PC_TELEPORT_ON_PASSOW );
		};
		if(KLOSTER_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the monastery of Innos " , PC_TELEPORT_ON_KLOSTER );
		};
		if(BIGFARM_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"...ферме Онара",PC_TELEPORT_ON_BIGFARM);
		};
		if(TOWN_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...east gate of the city of Khorinis " , PC_TELEPORT_ON_TOWN );
		};
		if(XARDAS_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...xardas tower " , PC_TELEPORT_ON_XARDAS );
		};
	}
	else  if (CurrentLevel ==  ADDONWORLD_ZEN )
	{
		if(ADW_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the hermitage " , PC_TELEPORT_ON_ADW );
		};
		if(PIRATCAMP_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the pirate camp " , PC_TELEPORT_ON_PIRATCAMP );
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(SKLEP_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to an abandoned crypt " , PC_TELEPORT_ON_SKLEP );
		};
		if(OLDPSI_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...camp of the Brotherhood of the Sleeper " , PC_TELEPORT_ON_OLDPSI );
		};
		if(OLDFORT_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the destroyed fort " , PC_TELEPORT_ON_OLDFORT );
		};
		if(DARKTOWER_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...old tower of Xardas " , PC_TELEPORT_ON_DARKTOWER );
		};
		if(ICE_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...passing to New Camp " , PC_TELEPORT_ON_ICE );
		};
		if(NETBEK_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the ruined monastery " , PC_TELEPORT_ON_NETBEK );
		};
		if(PASSNW_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...passway in Horinis " , PC_TELEPORT_ON_PASSNW );
		};
		if(CASTLE_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to the Ore Barons ' Castle " , PC_TELEPORT_ON_CASTLE );
		};
	}
	else if(CurrentLevel == ADANOSVALLEY_ZEN)
	{
		if(COMPLEX_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...temple square " , PC_TELEPORT_ON_COMPLEX );
		};
		if(LIFECIRCLE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"...Кругу Жизни",PC_TELEPORT_ON_LIFECIRCLE);
		};
		if(PASSAV_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...passage to the plateau of the Ancients " , PC_TELEPORT_ON_PASSAV );
		};
		if(PYRAMIDE_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...To the Temple of Truth " , PC_TELEPORT_ON_PYRAMIDE );
		};
		if(TEARHRAM_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"...Алтарю Слез",PC_TELEPORT_ON_TEARHRAM);
		};
	}
	else if(CurrentLevel == ORCMOUNTAIN_ZEN)
	{
		if(ORCMOUNTAIN_TP == TRUE)
		{
			Info_AddChoice( PC_TELEPORT_ON , " ...to runestone " , PC_TELEPORT_ON_ORCMOUNTAIN );
		};
	};
	
	Info_AddChoice(PC_TELEPORT_ON,DIALOG_BACK,PC_TELEPORT_ON_BACK);
};

func void PC_TELEPORT_ON_BACK()
{
	Info_ClearChoices(PC_TELEPORT_ON);
};

func void PC_TELEPORT_ON_ADW()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADW_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PIRATCAMP()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PIRATCAMP_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ORCMOUNTAIN()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ORCMOUNTAIN_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_XARDAS()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	XARDAS_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_TOWN()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TOWN_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_TAVERNE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TAVERNE_TP_OK = TRUE ;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PSI()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PSI_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PASSOW()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PASSOW_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_BIGFARM()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	BIGFARM_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_KLOSTER()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	KLOSTER_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void  PC_TELEPORT_ON_ARROW ()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ARROW_TP_OK = TRUE ;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_HUNT()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	HUNT_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_VINOCAVE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	VINOCAVE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SUNCIRCLE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SUNCIRCLE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ADWRUINS()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADWRUINS_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_BLACKTROLL()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	BLACKTROLL_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_CASTLE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	CASTLE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ICE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ICE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void  PC_TELEPORT_ON_STORE ()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SKLEP_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_DARKTOWER()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	DARKTOWER_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OLDFORT()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OLDFORT_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OLDPSI()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OLDPSI_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_NETBEK()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	NETBEK_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PASSNW()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PASSNW_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_TEARHRAM()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TEARHRAM_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PYRAMIDE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PYRAMIDE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PASSAV()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PASSAV_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_LIFECIRCLE()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	LIFECIRCLE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_COMPLEX()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	COMPLEX_TP_OK = TRUE;
	TeleportCheck = FALSE;
};
