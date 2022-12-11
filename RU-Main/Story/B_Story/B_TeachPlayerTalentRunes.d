

func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int cost;
	var int money;
	var int tempRuneSkill;
	var C_Npc scrolltrader_kdf;
	var C_Npc scrolltrader_kdw;
	var C_Npc scrolltrader_gur;
	var C_Npc scrolltrader_dmt;
	var C_Npc scrolltrader_prm;
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	money = (cost *  200 ) /  TEMPSSBMODE ;

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
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes, " In order to create a magic rune, in addition to the necessary spell, I still need some components. With these components and a runestone of a certain type, I can create the rune I need on the rune table. To create runes of the first and second circle, ordinary runestones are needed , for runes of the third and fourth circles - senior runestones, for runes of the fifth and sixth circles - higher runestones. Runestones themselves can be made on a rune table from pieces of runestone. However, I don’t know where to get it. " ) ;

	if (Npc_IsDead(Gorax) ==  FALSE )
	{
		scrolltrader_kdf = Hlp_GetNpc(Gorax);
	}
	else  if (Npc_IsDead(Isgaroth) ==  FALSE )
	{
		scrolltrader_kdf = Hlp_GetNpc(Isgaroth);
	};
	if (Npc_IsDead(Cronos_ADW) ==  FALSE )
	{
		scrolltrader_kdw = Hlp_GetNpc(Cronos_ADW);
	};
	if(CHOOSESTONE == TRUE)
	{
		if(hero.guild == GIL_GUR)
		{
			if (Npc_IsDead(baaltyon) ==  FALSE )
			{
				scrolltrader_gur = Hlp_GetNpc(baaltyon);
			};
		}
		else
		{
			if (Npc_IsDead( NETBEK ) ==  FALSE )
			{
				scrolltrader_gur = Hlp_GetNpc(NETBEK);
			};
		};
	}
	else
	{
		if (Npc_IsDead(baaltyon) ==  FALSE )
		{
			scrolltrader_gur = Hlp_GetNpc(baaltyon);
		};
	};
	if (Npc_IsDead(Xardas) ==  FALSE )
	{
		scrolltrader_dmt = Hlp_GetNpc(Xardas);
	};
	if (Npc_IsDead(vlk_6027_numbers) ==  FALSE )
	{
		scrolltrader_prm = Hlp_GetNpc(vlk_6027_taliasan);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalLightHeal,1);
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
		CreateInvItems(hero,ItRu_PalHolyBolt, 1 );
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalMediumHeal,1);
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalRepelEvil, 1 );
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalFullHeal,1);
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalDestroyEvil,1);
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_SummonCrait)
	{
		PLAYER_TALENT_RUNES[97] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TELEPORTDAGOT)
	{
		PLAYER_TALENT_RUNES[90] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		PLAYER_TALENT_RUNES_18 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Light,1);
		AI_Print( " Learned how to make a rune - 'Light' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Light' rune: magic spell scroll, gold coin. " );
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		PLAYER_TALENT_RUNES_21 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_LightHeal,1);
		AI_Print( " Learned how to make a rune - 'Healing' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Heal' rune: magic spell scroll, healing root. " );
	};
	if(spell == SPL_UnlockChest)
	{
		PLAYER_TALENT_RUNES[SPL_UnlockChest] = TRUE;
		PLAYER_TALENT_RUNES_99 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Unlock,1);
		AI_Print( " Learned how to make a rune - 'Magic Hacking' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Magic Lockpicking' rune: magic spell scroll, master key. " );
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		PLAYER_TALENT_RUNES_25 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumWolf,1);
		AI_Print( " Learned how to make a rune - 'Summon Warg' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Warg' rune: magic spell scroll, warg hide. " );
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		PLAYER_TALENT_RUNES_35 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumGol,1);
		AI_Print( " Learned how to make rune - 'Summon Stone Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Stone Golem' rune: Magic Spell Scroll, Stone Golem Heart. " );
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		PLAYER_TALENT_RUNES_28 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_MediumHeal,1);
		AI_Print( " Learned how to make Rune - 'Cleansing Light' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Cleansing Light' rune: magic spell scroll, antidote, holy water. " );
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		PLAYER_TALENT_RUNES_36 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_HarmUndead,1);
		AI_Print( " Learned how to make a rune - 'Destroy Undead' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Undead Destroy rune: magic spell scroll, holy water. " );
	};
	if (spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		PLAYER_TALENT_RUNES_41 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_FullHeal,1);
		AI_Print( " Learned how to make a rune - 'Infusion' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Invigorating' rune: magic spell scroll, seraph, ice quartz, bogweed. " );
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		PLAYER_TALENT_RUNES_19 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firebolt,1);
		AI_Print( " Learned how to make a rune - 'Fire Arrow' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Firebolt' rune: magic spell scroll, sulphur. " );
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		PLAYER_TALENT_RUNES_23 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_InstantFireball,1);
		AI_Print( " Learned how to make rune - 'Fireball' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fireball' rune: magic spell scroll, resin. " );
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		PLAYER_TALENT_RUNES_38 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firestorm,1);
		AI_Print( " Learned how to make Rune - 'Firestorm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Firestorm' rune are a magic spell scroll, brimstone and resin. " );
	};
	if(spell == SPL_SUMMONFIREGOLEM)
	{
		PLAYER_TALENT_RUNES[80] = TRUE;
		PLAYER_TALENT_RUNES_80 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itsc_sumfiregol,1);
		AI_Print( " Learned how to make rune - 'Summon Fire Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Fire Golem' rune are a magic spell scroll, fire golem heart, fire tongue, and brimstone. " );
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		PLAYER_TALENT_RUNES_30 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_ChargeFireBall,1);
		AI_Print( " Learned how to make Rune - 'Great Fireball' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Greater Fireball Rune: Magic Spell Scroll, Brimstone and Resin. " );
	};
	if(spell == SPL_FIRELIGHT)
	{
		PLAYER_TALENT_RUNES[93] = TRUE;
		PLAYER_TALENT_RUNES_93 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_firelight,1);
		AI_Print( " Learned how to make a rune - 'Sheath of Fire' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Shroud of Fire rune are spell magic formula, resin, fire tongue, ice quartz, and aquamarine. " );
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		PLAYER_TALENT_RUNES_37 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Pyrokinesis,1);
		AI_Print( " Learned how to make rune - 'Firestorm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Firestorm' rune are magic spell scroll, brimstone, and fire tongue. " );
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		PLAYER_TALENT_RUNES_42 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firerain,1);
		AI_Print( " Learned how to make a rune - 'Rain of Fire' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Rain of Fire' rune are a magic spell scroll, resin, brimstone, and a fire tongue. " );
	};
	if(spell == SPL_FireMeteor)
	{
		PLAYER_TALENT_RUNES[SPL_FireMeteor] = TRUE;
		PLAYER_TALENT_RUNES_103 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_FireMeteor,1);
		AI_Print( " Learned how to make a rune - 'Meteorite' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Meteorite' rune are the spell's magic formula, sulfur, resin, rock crystal, and fire tongue. " );
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Zap,1);
		AI_Print( " Learned how to make a rune - 'Lightning' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Lightning' rune: magic spell scroll, rock crystal. " );
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		PLAYER_TALENT_RUNES_73 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icelance,1);
		AI_Print( " Learned how to make a rune - 'Ice Spear' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Ice Spear Rune: Magic Spell Scroll, Ice Quartz, and Rock Crystal. " );
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		PLAYER_TALENT_RUNES_20 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icebolt,1);
		AI_Print( " Learned how to make a rune - 'Frostbolt' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Frostbolt Rune: Magic Spell Scroll, Ice Quartz. " );
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		PLAYER_TALENT_RUNES_33 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceCube,1);
		AI_Print( " Learned how to make a rune - 'Ice Block' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Ice Block' rune are a magic spell scroll, ice quartz and aquamarine. " );
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		PLAYER_TALENT_RUNES_34 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_ThunderBall,1);
		AI_Print( " Learned how to make a rune - 'Thunderball' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Thunderball' rune are a magic spell scroll, brimstone, and rock crystal. " );
	};
	if(spell == SPL_SUMMONSHOAL)
	{
		PLAYER_TALENT_RUNES[98] = TRUE;
		PLAYER_TALENT_RUNES_98 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumshoal,1);
		AI_Print( " Learned how to make rune - 'Summon Snow Swarm' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the Summon Snow Swarm rune are a magic spell scroll, three snow wolf skins, and ice quartz. " );
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		PLAYER_TALENT_RUNES_72 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Waterfist,1);
		AI_Print( " Learned how to make rune - 'Water Fist' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Water Fist rune are a magic spell scroll, aquamarine and rock crystal. " );
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		PLAYER_TALENT_RUNES_29 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_LightningFlash,1);
		AI_Print( " Learned how to make a rune - 'Thunderbolt' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Thunderbolt' rune are a magic spell scroll, rock crystal, and ice quartz. " );
	};
	if(spell == SPL_SUMMONICEGOLEM)
	{
		PLAYER_TALENT_RUNES[89] = TRUE;
		PLAYER_TALENT_RUNES_89 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumicegol,1);
		AI_Print( " Learned how to make rune - 'Summon Ice Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Ice Golem' rune are Magic Spell Scroll, Ice Golem Heart, Ice Quartz and Aquamarine. " );
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		PLAYER_TALENT_RUNES_39 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceWave,1);
		AI_Print( " Learned how to make a rune - 'Ice Wave' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Frostwave Rune: Magic Spell Scroll, Ice Quartz, and Aquamarine. " );
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		PLAYER_TALENT_RUNES_75 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Geyser,1);
		AI_Print( " Learned how to make a rune - 'Geyser' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Geyser' rune: magic spell scroll, aquamarine. " );
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		PLAYER_TALENT_RUNES_70 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Thunderstorm,1);
		AI_Print( " Learned how to make a rune - 'Storm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Storm' rune are a magic spell scroll, ice quartz, and a wing. " );
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		PLAYER_TALENT_RUNES_27 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Sleep,1);
		AI_Print( " Learned how to make a rune - 'Sleep' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Sleep' rune: magic spell scroll, bogweed. " );
	};
	if(spell == SPL_BERZERK)
	{
		PLAYER_TALENT_RUNES[95] = TRUE;
		PLAYER_TALENT_RUNES_95 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_berzerk,1);
		AI_Print( " Learned how to make a rune - 'Spear of the Sleeper' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Spear of the Sleeper' rune: magic spell scroll, bogweed, and ice quartz. " );
	};
	if(spell == SPL_TELEKINESIS)
	{
		PLAYER_TALENT_RUNES[83] = TRUE;
		PLAYER_TALENT_RUNES_83 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_telekinesis,1);
		AI_Print( " Learned how to make rune - 'Spirit Absorption' " );
		B_LogEntry(TOPIC_TalentRunes, " Constituent ingredients for crafting the rune 'Spirit Absorption': the magic formula of the spell, resin, bogweed, ice quartz and aquamarine. " );
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		PLAYER_TALENT_RUNES_26 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Windfist,1);
		AI_Print( " Learned how to make Rune - 'Wind Fist' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting Windfist Rune: Magic Spell Scroll, Coal. " );
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		PLAYER_TALENT_RUNES_32 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Fear,1);
		AI_Print( " Learned how to make a rune - 'Fear' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fear' rune: magic spell scroll, black pearl. " );
	};
	if(spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		PLAYER_TALENT_RUNES_59 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Charm,1);
		AI_Print( " Learned how to make a rune - 'Oblivion' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Oblivion Rune: Magic Spell Scroll, Aquamarine, and Ice Quartz. " );
	};
	if(spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		PLAYER_TALENT_RUNES_82 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_greententacle,1);
		AI_Print( " Learned how to make a rune - 'Entangle Roots' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Entangle with Roots' rune are a magic spell scroll, resin and bogweed. " );
	};
	if(spell == SPL_SUMMONSWAMPGOLEM)
	{
		PLAYER_TALENT_RUNES[100] = TRUE;
		PLAYER_TALENT_RUNES_100 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_sumswpgol,1);
		AI_Print( " Learned how to make rune - 'Summon Swamp Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Swamp Golem' rune: Magic Spell Scroll, Swamp Golem Heart, Three Swamp Grass. " );
	};
	if(spell == SPL_SEVEREFETIDITY)
	{
		PLAYER_TALENT_RUNES[96] = TRUE;
		PLAYER_TALENT_RUNES_96 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_severefetidity,1);
		AI_Print( " Learned how to make Rune - 'Terrible Stench' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Terrible Stench' rune are a magic spell scroll, bogweed, sulphur, and coal. " );
	};
	if(spell == SPL_CONTROL)
	{
		PLAYER_TALENT_RUNES[94] = TRUE;
		PLAYER_TALENT_RUNES_94 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_control,1);
		AI_Print( " Learned how to make a rune - 'Hypnosis' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Hypnosis' rune: spell magic formula, bogweed, coal, and black pearl. " );
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		PLAYER_TALENT_RUNES_71 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Whirlwind,1);
		AI_Print( " Learned how to make a rune - 'Tornado' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Whirlwind rune: magic spell scroll, bloodhornet wing, bogweed, and ice quartz. " );
	};
	if(spell == SPL_Deathbolt)
	{
		PLAYER_TALENT_RUNES[SPL_Deathbolt] = TRUE;
		PLAYER_TALENT_RUNES_61 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathbolt,1);
		AI_Print( " Learned how to make a rune - 'Shadow Bolt' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Shadow Bolt' rune: magic spell scroll, black pearl. " );
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_22 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumGobSkel,1);
		AI_Print( " Learned how to make rune - 'Summon Skeleton' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Skeleton' rune: magic spell scroll, skeleton bone. " );
	};
	if(spell == SPL_ManaForLife)
	{
		PLAYER_TALENT_RUNES[SPL_ManaForLife] = TRUE;
		PLAYER_TALENT_RUNES_86 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_ManaForLife,1);
		AI_Print( " Learned how to make a rune - 'Soul Rend' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Soul Rend rune are a magic spell scroll, brimstone, and resin. " );
	};
	if(spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		PLAYER_TALENT_RUNES_88 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_sumzombie,1);
		AI_Print( " Learned how to make rune - 'Summon Zombie' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Zombie' rune: magic spell scroll, coal, dead flesh. " );
	};
	if(spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		PLAYER_TALENT_RUNES_81 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_swarm,1);
		AI_Print( " Learned how to make a rune - 'Swarm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Swarm' rune: magic spell scroll, aquamarine, bogweed and resin. " );
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_31 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumSkel,1);
		AI_Print( " Learned how to make rune - 'Summon Skeleton Warrior' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Summon Skeleton Warrior' rune are a magic spell scroll, a skeleton bone, and a black pearl. " );
	};
	if(spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		PLAYER_TALENT_RUNES_85 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_energyball,1);
		AI_Print( " Learned how to make a rune - 'Spear of Darkness' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Spear of Darkness' rune are a magic spell scroll, black pearl, ice quartz, rock crystal, and sulfur. " );
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		PLAYER_TALENT_RUNES_40 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumDemon,1);
		AI_Print( " Learned how to make rune - 'Summon Demon' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Summon Demon' rune: magic spell scroll, supreme runestone, demon's heart, two sulfur, three resin, coal, three black pearls. " ) ;
	};
	if(spell == SPL_Deathball)
	{
		PLAYER_TALENT_RUNES[SPL_Deathball] = TRUE;
		PLAYER_TALENT_RUNES_62 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathball,1);
		AI_Print( " Learned how to make rune - 'Orb of Death' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Death Ball' rune are magic spell scroll, fire tongue, brimstone and resin. " );
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		PLAYER_TALENT_RUNES_45 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_ArmyOfDarkness,1);
		AI_Print( " Learned how to make a rune - 'Army of Darkness' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Army of Darkness' rune are Magic Spell Scroll, Skeleton Bone, Black Pearl, Stone Golem Heart, and Demon Heart. " );
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		PLAYER_TALENT_RUNES_44 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_MassDeath,1);
		AI_Print( " Learned how to make a rune - 'Black Mist' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Black Mist' rune: magic spell scroll, skeleton bone, ectoplasm, and black pearl. " );
	};
	if(spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		PLAYER_TALENT_RUNES_87 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_skull,1);
		AI_Print( " Learned how to make a rune - 'Cry of the Dead' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Cry of the Dead' rune: magic spell scroll, black pearl, demon heart, skull, resin and brimstone. " );
	};
	if(spell == SPL_GuruWrath)
	{
		PLAYER_TALENT_RUNES[SPL_GuruWrath] = TRUE;
		PLAYER_TALENT_RUNES_104 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_GuruWrath,1);
		AI_Print( " Learned how to make a rune - 'Anger of the Elements' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Elemental Wrath' rune: the magic formula of the spell and the heart of four golems of various elements. " );
	};
	if(spell == SPL_RapidFirebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidFirebolt] = TRUE;
		PLAYER_TALENT_RUNES_107 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_RapidFirebolt,1);
		AI_Print( " Learned how to make a rune - 'Fire Flash' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fire Flash' rune: Magic Spell Scroll, Brimstone, Resin. " );
	};
	if(spell == SPL_MagicCage)
	{
		PLAYER_TALENT_RUNES[SPL_MagicCage] = TRUE;
		PLAYER_TALENT_RUNES_111 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_MagicCage,1);
		AI_Print( " Learned how to make a rune - 'Fire Cage' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fire Cage' rune: magic spell scroll, brimstone, resin, fire tongue . " );
	};
	if(spell == SPL_Explosion)
	{
		PLAYER_TALENT_RUNES[SPL_Explosion] = TRUE;
		PLAYER_TALENT_RUNES_114 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Explosion,1);
		AI_Print( " Learned how to make a rune - 'Fire Blast' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Fire Blast' rune are a magic spell scroll, brimstone, resin, fire tongue, and aquamarine. " );
	};
	if(spell == SPL_RapidIcebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidIcebolt] = TRUE;
		PLAYER_TALENT_RUNES_108 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_RapidIcebolt,1);
		AI_Print( " Learned how to make a rune - 'Ice Flash' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Frostburst rune are a magic spell scroll, rock crystal, and ice quartz. " );
	};
	if(spell == SPL_AdanosBall)
	{
		PLAYER_TALENT_RUNES[SPL_AdanosBall] = TRUE;
		PLAYER_TALENT_RUNES_116 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_AdanosBall,1);
		AI_Print( " Learned how to make a rune - 'Hand of Chaos' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Hand of Chaos' rune: magic spell scroll, rock crystal, black pearl, ice quartz and aquamarine. " );
	};
	if(spell == SPL_Rage)
	{
		PLAYER_TALENT_RUNES[SPL_Rage] = TRUE;
		PLAYER_TALENT_RUNES_109 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Rage,1);
		AI_Print( " Learned how to make a rune - 'Possession' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Possession' rune are a magic spell scroll, skeletal bone, ectoplasm, sulfur, and resin. " );
	};
	if(spell == SPL_Lacerate)
	{
		PLAYER_TALENT_RUNES[SPL_Lacerate] = TRUE;
		PLAYER_TALENT_RUNES_112 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Lacerate,1);
		AI_Print( " Learned how to make a rune - 'Depletion' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Depletion' rune are magic spell scroll, skeletal bone, sulfur, rock crystal, and ice quartz. " );
	};
	if(spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		PLAYER_TALENT_RUNES_113 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Extricate,1);
		AI_Print( " Learned how to make a rune - 'Shockwave' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Shockwave' Rune: Magic Spell Scroll, Blood Hornet Wing, Mireweed, Black Pearl, Ice Quartz, and Aquamarine. " );
	};
	if(spell == SPL_Elevate)
	{
		PLAYER_TALENT_RUNES[SPL_Elevate] = TRUE;
		PLAYER_TALENT_RUNES_115 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Elevate,1);
		AI_Print( " Learned how to make rune - 'Ascension' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Ascension' rune are magic spell scroll, bogweed, sulphur, coal, black pearl, ice quartz and resin. " );
	};
	if(spell == SPL_Acid)
	{
		PLAYER_TALENT_RUNES[SPL_Acid] = TRUE;
		PLAYER_TALENT_RUNES_117 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Acid,1);
		CreateInvItems(scrolltrader_gur,ITPO_POISON,1);
		AI_Print( " Learned how to make Rune - 'Poisonous Bite' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Poisonous Bite rune are Magic Spell Scroll, Skeleton Bone, Bogweed, Black Pearl, Poison and Resin. " );
	};
	if(spell == SPL_Quake)
	{
		PLAYER_TALENT_RUNES[SPL_Quake] = TRUE;
		PLAYER_TALENT_RUNES_110 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Quake,1);
		AI_Print( " Learned how to make a rune - 'Earthquake' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Earthquake' rune are a magic spell scroll, black pearl, stone golem heart, bogweed, black pearl, aquamarine and resin. " );
	};

	if(TalentCount_Rune[0] > 100)
	{
		TalentCount_Rune[0] = 100;
	};
	if(TalentCount_Rune[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,4);
	}
	else if(TalentCount_Rune[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,3);
	}
	else if(TalentCount_Rune[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_RUNES,TalentCount_Rune[0]);		
	Snd_Play("LevelUP");

	if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
	{
		ATR_INTELLECT = ATR_INTELLECT + 1;
		Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
	};

	return TRUE;
};

func int b_teachplayertalentrunesguardians(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int cost;
	var int tempRuneSkill;
	var C_Npc scrolltrader_kdf;
	var C_Npc scrolltrader_kdw;
	var C_Npc scrolltrader_gur;
	var C_Npc scrolltrader_dmt;
	var C_Npc scrolltrader_prm;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return  FALSE ;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + cost;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes, " In order to create a magic rune, in addition to the necessary spell, I still need some components. With these components and a runestone of a certain type, I can create the rune I need on the rune table. To create runes of the first and second circle, ordinary runestones are needed , for runes of the third and fourth circles - senior runestones, for runes of the fifth and sixth circles - higher runestones. Runestones themselves can be made on a rune table from pieces of runestone. However, I don’t know where to get it. " ) ;

	if (Npc_IsDead(Gorax) ==  FALSE )
	{
		scrolltrader_kdf = Hlp_GetNpc(Gorax);
	}
	else  if (Npc_IsDead(Isgaroth) ==  FALSE )
	{
		scrolltrader_kdf = Hlp_GetNpc(Isgaroth);
	};
	if (Npc_IsDead(Cronos_ADW) ==  FALSE )
	{
		scrolltrader_kdw = Hlp_GetNpc(Cronos_ADW);
	};
	if (Npc_IsDead(baaltyon) ==  FALSE )
	{
		scrolltrader_gur = Hlp_GetNpc(baaltyon);
	};
	if (Npc_IsDead(Xardas) ==  FALSE )
	{
		scrolltrader_dmt = Hlp_GetNpc(Xardas);
	};
	if (Npc_IsDead(vlk_6027_numbers) ==  FALSE )
	{
		scrolltrader_prm = Hlp_GetNpc(vlk_6027_taliasan);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalLightHeal,1);
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
		CreateInvItems(hero,ItRu_PalHolyBolt, 1 );
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalMediumHeal,1);
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalRepelEvil, 1 );
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalFullHeal,1);
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalDestroyEvil,1);
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_SummonCrait)
	{
		PLAYER_TALENT_RUNES[97] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TELEPORTDAGOT)
	{
		PLAYER_TALENT_RUNES[90] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		PLAYER_TALENT_RUNES_18 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Light,1);
		AI_Print( " Learned how to make a rune - 'Light' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Light' rune: magic spell scroll, gold coin. " );
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		PLAYER_TALENT_RUNES_21 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_LightHeal,1);
		AI_Print( " Learned how to make a rune - 'Healing' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Heal' rune: magic spell scroll, healing root. " );
	};
	if(spell == SPL_UnlockChest)
	{
		PLAYER_TALENT_RUNES[SPL_UnlockChest] = TRUE;
		PLAYER_TALENT_RUNES_99 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Unlock,1);
		AI_Print( " Learned how to make a rune - 'Magic Hacking' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Magic Lockpicking' rune: magic spell scroll, master key. " );
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		PLAYER_TALENT_RUNES_25 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumWolf,1);
		AI_Print( " Learned how to make a rune - 'Summon Warg' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Warg' rune: magic spell scroll, warg hide. " );
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		PLAYER_TALENT_RUNES_35 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumGol,1);
		AI_Print( " Learned how to make rune - 'Summon Stone Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Stone Golem' rune: Magic Spell Scroll, Stone Golem Heart. " );
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		PLAYER_TALENT_RUNES_28 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_MediumHeal,1);
		AI_Print( " Learned how to make Rune - 'Cleansing Light' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Cleansing Light' rune: magic spell scroll, antidote, holy water. " );
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		PLAYER_TALENT_RUNES_36 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_HarmUndead,1);
		AI_Print( " Learned how to make a rune - 'Destroy Undead' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Undead Destroy rune: magic spell scroll, holy water. " );
	};
	if (spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		PLAYER_TALENT_RUNES_41 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_FullHeal,1);
		AI_Print( " Learned how to make a rune - 'Infusion' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Invigorating' rune: magic spell scroll, seraph, ice quartz, bogweed. " );
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		PLAYER_TALENT_RUNES_19 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firebolt,1);
		AI_Print( " Learned how to make a rune - 'Fire Arrow' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Firebolt' rune: magic spell scroll, sulphur. " );
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		PLAYER_TALENT_RUNES_23 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_InstantFireball,1);
		AI_Print( " Learned how to make rune - 'Fireball' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fireball' rune: magic spell scroll, resin. " );
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		PLAYER_TALENT_RUNES_38 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firestorm,1);
		AI_Print( " Learned how to make Rune - 'Firestorm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Firestorm' rune are a magic spell scroll, brimstone and resin. " );
	};
	if(spell == SPL_SUMMONFIREGOLEM)
	{
		PLAYER_TALENT_RUNES[80] = TRUE;
		PLAYER_TALENT_RUNES_80 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itsc_sumfiregol,1);
		AI_Print( " Learned how to make rune - 'Summon Fire Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Fire Golem' rune are a magic spell scroll, fire golem heart, fire tongue, and brimstone. " );
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		PLAYER_TALENT_RUNES_30 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_ChargeFireBall,1);
		AI_Print( " Learned how to make Rune - 'Great Fireball' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Greater Fireball Rune: Magic Spell Scroll, Brimstone and Resin. " );
	};
	if(spell == SPL_FIRELIGHT)
	{
		PLAYER_TALENT_RUNES[93] = TRUE;
		PLAYER_TALENT_RUNES_93 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_firelight,1);
		AI_Print( " Learned how to make a rune - 'Sheath of Fire' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Shroud of Fire rune are spell magic formula, resin, fire tongue, ice quartz, and aquamarine. " );
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		PLAYER_TALENT_RUNES_37 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Pyrokinesis,1);
		AI_Print( " Learned how to make rune - 'Firestorm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Firestorm' rune are magic spell scroll, brimstone, and fire tongue. " );
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		PLAYER_TALENT_RUNES_42 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firerain,1);
		AI_Print( " Learned how to make a rune - 'Rain of Fire' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Rain of Fire' rune are a magic spell scroll, resin, brimstone, and a fire tongue. " );
	};
	if(spell == SPL_FireMeteor)
	{
		PLAYER_TALENT_RUNES[SPL_FireMeteor] = TRUE;
		PLAYER_TALENT_RUNES_103 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_FireMeteor,1);
		AI_Print( " Learned how to make a rune - 'Meteorite' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Meteorite' rune are the spell's magic formula, sulfur, resin, rock crystal, and fire tongue. " );
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Zap,1);
		AI_Print( " Learned how to make a rune - 'Lightning' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Lightning' rune: magic spell scroll, rock crystal. " );
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		PLAYER_TALENT_RUNES_73 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icelance,1);
		AI_Print( " Learned how to make a rune - 'Ice Spear' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Ice Spear Rune: Magic Spell Scroll, Ice Quartz, and Rock Crystal. " );
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		PLAYER_TALENT_RUNES_20 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icebolt,1);
		AI_Print( " Learned how to make a rune - 'Frostbolt' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Frostbolt Rune: Magic Spell Scroll, Ice Quartz. " );
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		PLAYER_TALENT_RUNES_33 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceCube,1);
		AI_Print( " Learned how to make a rune - 'Ice Block' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Ice Block' rune are a magic spell scroll, ice quartz and aquamarine. " );
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		PLAYER_TALENT_RUNES_34 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_ThunderBall,1);
		AI_Print( " Learned how to make a rune - 'Thunderball' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Thunderball' rune are a magic spell scroll, brimstone, and rock crystal. " );
	};
	if(spell == SPL_SUMMONSHOAL)
	{
		PLAYER_TALENT_RUNES[98] = TRUE;
		PLAYER_TALENT_RUNES_98 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumshoal,1);
		AI_Print( " Learned how to make rune - 'Summon Snow Swarm' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the Summon Snow Swarm rune are a magic spell scroll, three snow wolf skins, and ice quartz. " );
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		PLAYER_TALENT_RUNES_72 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Waterfist,1);
		AI_Print( " Learned how to make rune - 'Water Fist' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Water Fist rune are a magic spell scroll, aquamarine and rock crystal. " );
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		PLAYER_TALENT_RUNES_29 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_LightningFlash,1);
		AI_Print( " Learned how to make a rune - 'Thunderbolt' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Thunderbolt' rune are a magic spell scroll, rock crystal, and ice quartz. " );
	};
	if(spell == SPL_SUMMONICEGOLEM)
	{
		PLAYER_TALENT_RUNES[89] = TRUE;
		PLAYER_TALENT_RUNES_89 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumicegol,1);
		AI_Print( " Learned how to make rune - 'Summon Ice Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Ice Golem' rune are Magic Spell Scroll, Ice Golem Heart, Ice Quartz and Aquamarine. " );
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		PLAYER_TALENT_RUNES_39 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceWave,1);
		AI_Print( " Learned how to make a rune - 'Ice Wave' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Frostwave Rune: Magic Spell Scroll, Ice Quartz, and Aquamarine. " );
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		PLAYER_TALENT_RUNES_75 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Geyser,1);
		AI_Print( " Learned how to make a rune - 'Geyser' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Geyser' rune: magic spell scroll, aquamarine. " );
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		PLAYER_TALENT_RUNES_70 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Thunderstorm,1);
		AI_Print( " Learned how to make a rune - 'Storm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Storm' rune are a magic spell scroll, ice quartz, and a wing. " );
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		PLAYER_TALENT_RUNES_27 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Sleep,1);
		AI_Print( " Learned how to make a rune - 'Sleep' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Sleep' rune: magic spell scroll, bogweed. " );
	};
	if(spell == SPL_BERZERK)
	{
		PLAYER_TALENT_RUNES[95] = TRUE;
		PLAYER_TALENT_RUNES_95 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_berzerk,1);
		AI_Print( " Learned how to make a rune - 'Spear of the Sleeper' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Spear of the Sleeper' rune: magic spell scroll, bogweed, and ice quartz. " );
	};
	if(spell == SPL_TELEKINESIS)
	{
		PLAYER_TALENT_RUNES[83] = TRUE;
		PLAYER_TALENT_RUNES_83 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_telekinesis,1);
		AI_Print( " Learned how to make rune - 'Spirit Absorption' " );
		B_LogEntry(TOPIC_TalentRunes, " Constituent ingredients for crafting the rune 'Spirit Absorption': the magic formula of the spell, resin, bogweed, ice quartz and aquamarine. " );
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		PLAYER_TALENT_RUNES_26 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Windfist,1);
		AI_Print( " Learned how to make Rune - 'Wind Fist' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting Windfist Rune: Magic Spell Scroll, Coal. " );
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		PLAYER_TALENT_RUNES_32 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Fear,1);
		AI_Print( " Learned how to make a rune - 'Fear' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fear' rune: magic spell scroll, black pearl. " );
	};
	if(spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		PLAYER_TALENT_RUNES_59 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Charm,1);
		AI_Print( " Learned how to make a rune - 'Oblivion' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Oblivion Rune: Magic Spell Scroll, Aquamarine, and Ice Quartz. " );
	};
	if(spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		PLAYER_TALENT_RUNES_82 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_greententacle,1);
		AI_Print( " Learned how to make a rune - 'Entangle Roots' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Entangle with Roots' rune are a magic spell scroll, resin and bogweed. " );
	};
	if(spell == SPL_SUMMONSWAMPGOLEM)
	{
		PLAYER_TALENT_RUNES[100] = TRUE;
		PLAYER_TALENT_RUNES_100 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_sumswpgol,1);
		AI_Print( " Learned how to make rune - 'Summon Swamp Golem' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Swamp Golem' rune: Magic Spell Scroll, Swamp Golem Heart, Three Swamp Grass. " );
	};
	if(spell == SPL_SEVEREFETIDITY)
	{
		PLAYER_TALENT_RUNES[96] = TRUE;
		PLAYER_TALENT_RUNES_96 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_severefetidity,1);
		AI_Print( " Learned how to make Rune - 'Terrible Stench' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Terrible Stench' rune are a magic spell scroll, bogweed, sulphur, and coal. " );
	};
	if(spell == SPL_CONTROL)
	{
		PLAYER_TALENT_RUNES[94] = TRUE;
		PLAYER_TALENT_RUNES_94 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_control,1);
		AI_Print( " Learned how to make a rune - 'Hypnosis' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Hypnosis' rune: spell magic formula, bogweed, coal, and black pearl. " );
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		PLAYER_TALENT_RUNES_71 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Whirlwind,1);
		AI_Print( " Learned how to make a rune - 'Tornado' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Whirlwind rune: magic spell scroll, bloodhornet wing, bogweed, and ice quartz. " );
	};
	if(spell == SPL_Deathbolt)
	{
		PLAYER_TALENT_RUNES[SPL_Deathbolt] = TRUE;
		PLAYER_TALENT_RUNES_61 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathbolt,1);
		AI_Print( " Learned how to make a rune - 'Shadow Bolt' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Shadow Bolt' rune: magic spell scroll, black pearl. " );
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_22 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumGobSkel,1);
		AI_Print( " Learned how to make rune - 'Summon Skeleton' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Skeleton' rune: magic spell scroll, skeleton bone. " );
	};
	if(spell == SPL_ManaForLife)
	{
		PLAYER_TALENT_RUNES[SPL_ManaForLife] = TRUE;
		PLAYER_TALENT_RUNES_86 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_ManaForLife,1);
		AI_Print( " Learned how to make a rune - 'Soul Rend' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Soul Rend rune are a magic spell scroll, brimstone, and resin. " );
	};
	if(spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		PLAYER_TALENT_RUNES_88 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_sumzombie,1);
		AI_Print( " Learned how to make rune - 'Summon Zombie' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Summon Zombie' rune: magic spell scroll, coal, dead flesh. " );
	};
	if(spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		PLAYER_TALENT_RUNES_81 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_swarm,1);
		AI_Print( " Learned how to make a rune - 'Swarm' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Swarm' rune: magic spell scroll, aquamarine, bogweed and resin. " );
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_31 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumSkel,1);
		AI_Print( " Learned how to make rune - 'Summon Skeleton Warrior' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Summon Skeleton Warrior' rune are a magic spell scroll, a skeleton bone, and a black pearl. " );
	};
	if(spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		PLAYER_TALENT_RUNES_85 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_energyball,1);
		AI_Print( " Learned how to make a rune - 'Spear of Darkness' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Spear of Darkness' rune are a magic spell scroll, black pearl, ice quartz, rock crystal, and sulfur. " );
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		PLAYER_TALENT_RUNES_40 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumDemon,1);
		AI_Print( " Learned how to make rune - 'Summon Demon' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Summon Demon' rune: magic spell scroll, supreme runestone, demon's heart, two sulfur, three resin, coal, three black pearls. " ) ;
	};
	if(spell == SPL_Deathball)
	{
		PLAYER_TALENT_RUNES[SPL_Deathball] = TRUE;
		PLAYER_TALENT_RUNES_62 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathball,1);
		AI_Print( " Learned how to make rune - 'Orb of Death' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Death Ball' rune are magic spell scroll, fire tongue, brimstone and resin. " );
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		PLAYER_TALENT_RUNES_45 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_ArmyOfDarkness,1);
		AI_Print( " Learned how to make a rune - 'Army of Darkness' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Army of Darkness' rune are Magic Spell Scroll, Skeleton Bone, Black Pearl, Stone Golem Heart, and Demon Heart. " );
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		PLAYER_TALENT_RUNES_44 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_MassDeath,1);
		AI_Print( " Learned how to make a rune - 'Black Mist' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Black Mist' rune: magic spell scroll, skeleton bone, ectoplasm, and black pearl. " );
	};
	if(spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		PLAYER_TALENT_RUNES_87 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_skull,1);
		AI_Print( " Learned how to make a rune - 'Cry of the Dead' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Cry of the Dead' rune: magic spell scroll, black pearl, demon heart, skull, resin and brimstone. " );
	};
	if(spell == SPL_GuruWrath)
	{
		PLAYER_TALENT_RUNES[SPL_GuruWrath] = TRUE;
		PLAYER_TALENT_RUNES_104 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_GuruWrath,1);
		AI_Print( " Learned how to make a rune - 'Anger of the Elements' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Elemental Wrath' rune: the magic formula of the spell and the heart of four golems of various elements. " );
	};
	if(spell == SPL_RapidFirebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidFirebolt] = TRUE;
		PLAYER_TALENT_RUNES_107 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_RapidFirebolt,1);
		AI_Print( " Learned how to make a rune - 'Fire Flash' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fire Flash' rune: Magic Spell Scroll, Brimstone, Resin. " );
	};
	if(spell == SPL_MagicCage)
	{
		PLAYER_TALENT_RUNES[SPL_MagicCage] = TRUE;
		PLAYER_TALENT_RUNES_111 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_MagicCage,1);
		AI_Print( " Learned how to make a rune - 'Fire Cage' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Fire Cage' rune: magic spell scroll, brimstone, resin, fire tongue . " );
	};
	if(spell == SPL_Explosion)
	{
		PLAYER_TALENT_RUNES[SPL_Explosion] = TRUE;
		PLAYER_TALENT_RUNES_114 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Explosion,1);
		AI_Print( " Learned how to make a rune - 'Fire Blast' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Fire Blast' rune are a magic spell scroll, brimstone, resin, fire tongue, and aquamarine. " );
	};
	if(spell == SPL_RapidIcebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidIcebolt] = TRUE;
		PLAYER_TALENT_RUNES_108 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_RapidIcebolt,1);
		AI_Print( " Learned how to make a rune - 'Ice Flash' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Frostburst rune are a magic spell scroll, rock crystal, and ice quartz. " );
	};
	if(spell == SPL_AdanosBall)
	{
		PLAYER_TALENT_RUNES[SPL_AdanosBall] = TRUE;
		PLAYER_TALENT_RUNES_116 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_AdanosBall,1);
		AI_Print( " Learned how to make a rune - 'Hand of Chaos' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Hand of Chaos' rune: magic spell scroll, rock crystal, black pearl, ice quartz and aquamarine. " );
	};
	if(spell == SPL_Rage)
	{
		PLAYER_TALENT_RUNES[SPL_Rage] = TRUE;
		PLAYER_TALENT_RUNES_109 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Rage,1);
		AI_Print( " Learned how to make a rune - 'Possession' " );
		B_LogEntry(TOPIC_TalentRunes, " The ingredients for crafting the 'Possession' rune are a magic spell scroll, skeletal bone, ectoplasm, sulfur, and resin. " );
	};
	if(spell == SPL_Lacerate)
	{
		PLAYER_TALENT_RUNES[SPL_Lacerate] = TRUE;
		PLAYER_TALENT_RUNES_112 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Lacerate,1);
		AI_Print( " Learned how to make a rune - 'Depletion' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Depletion' rune are magic spell scroll, skeletal bone, sulfur, rock crystal, and ice quartz. " );
	};
	if(spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		PLAYER_TALENT_RUNES_113 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Extricate,1);
		AI_Print( " Learned how to make a rune - 'Shockwave' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting 'Shockwave' Rune: Magic Spell Scroll, Blood Hornet Wing, Mireweed, Black Pearl, Ice Quartz, and Aquamarine. " );
	};
	if(spell == SPL_Elevate)
	{
		PLAYER_TALENT_RUNES[SPL_Elevate] = TRUE;
		PLAYER_TALENT_RUNES_115 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Elevate,1);
		AI_Print( " Learned how to make rune - 'Ascension' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Ascension' rune are magic spell scroll, bogweed, sulphur, coal, black pearl, ice quartz and resin. " );
	};
	if(spell == SPL_Acid)
	{
		PLAYER_TALENT_RUNES[SPL_Acid] = TRUE;
		PLAYER_TALENT_RUNES_117 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Acid,1);
		AI_Print( " Learned how to make Rune - 'Poisonous Bite' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the Poisonous Bite rune are Magic Spell Scroll, Skeleton Bone, Bogweed, Black Pearl, Poison and Resin. " );
	};
	if(spell == SPL_Quake)
	{
		PLAYER_TALENT_RUNES[SPL_Quake] = TRUE;
		PLAYER_TALENT_RUNES_110 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Quake,1);
		AI_Print( " Learned how to make a rune - 'Earthquake' " );
		B_LogEntry(TOPIC_TalentRunes, " Ingredients for crafting the 'Earthquake' rune are a magic spell scroll, black pearl, stone golem heart, bogweed, black pearl, aquamarine and resin. " );
	};

	if(TalentCount_Rune[0] > 100)
	{
		TalentCount_Rune[0] = 100;
	};
	if(TalentCount_Rune[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,4);
	}
	else if(TalentCount_Rune[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,3);
	}
	else if(TalentCount_Rune[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_RUNES,TalentCount_Rune[0]);		
	Snd_Play("LevelUP");

	if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
	{
		ATR_INTELLECT = ATR_INTELLECT + 1;
		Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
	};

	return TRUE;
};

func void b_wispdetector_learneffect(var C_Npc teacher)
{
	AI_PlayAni(teacher,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	Snd_Play("WSP_Dead_A1");
};

func int b_teachplayertalentwispdetector(var C_Npc slf,var C_Npc oth,var int wispskill,var int kosten)
{
	if (Npc_HasItems(hero,ItMi_Nugget) < cost)
	{
		AI_PrintClr( " You don't have enough magic ore... " , 177 , 58 , 17 );
		return  FALSE ;
	};

	Npc_RemoveInvItems(hero,ItMi_Nugget,kosten);

	if(wispskill == WISPSKILL_FF)
	{
		player_talent_wispdetector[WISPSKILL_FF] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_NONE)
	{
		player_talent_wispdetector[WISPSKILL_NONE] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_RUNE)
	{
		player_talent_wispdetector[WISPSKILL_RUNE] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_MAGIC)
	{
		player_talent_wispdetector[WISPSKILL_MAGIC] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_FOOD)
	{
		player_talent_wispdetector[WISPSKILL_FOOD] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_POTIONS)
	{
		player_talent_wispdetector[WISPSKILL_POTIONS] = TRUE;
		b_wispdetector_learneffect(slf);
	};

	AI_Print(PRINT_LearnWispDetector);
	return TRUE;
};
