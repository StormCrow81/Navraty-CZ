

var int prayday_ch1;
var int prayday_ch2;
var int prayday_ch3;
var int prayday_ch4;

var string concatDonation;
var string concatText;

var int Shrine_STR_Bonus;
var int Shrine_DEX_Bonus;
var int Shrine_MANA_Bonus;
var int shrine_hp_bonus;
var int SpecialBless;
var int ShrineIsObsessed;
var int shrinehealing;
var int ShrinesHealed;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_37;
var int ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_66;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_04;
var int ShrineIsObsessed_arrow;
var int ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02;
var int ShrineIsObsessed_NW_FARM3_BIGWOOD_02;
var int change_lev;

func void C_IsShrineObsessed(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
		ShrineIsObsessed = TRUE;
		if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_37") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_37 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_37 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM1_CONNECT_XARDAS") < 2000) && (ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_66") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_66 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_66 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_04") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_04 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_04 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else  if ((Npc_GetDistToWP(hero, " ARROW " ) <  2000 ) && (ShrineIsObsessed_ARROW ==  TRUE ))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SAGITTA = FALSE ;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_BIGMILL_MALAKSVERSTECK_02") < 2000) && (ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_BIGWOOD_02") < 2000) && (ShrineIsObsessed_NW_FARM3_BIGWOOD_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else
		{
			ShrineIsObsessed = FALSE;
		};
	};
};


instance PC_PrayShrine_HEALSHRINE(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PrayShrine_HEALSHRINE_Condition;
	information = PC_PrayShrine_HEALSHRINE_Info;
	permanent = TRUE;
	description = " Consecrate the statue of Innos " ;
};


func int PC_PrayShrine_HEALSHRINE_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && Npc_HasItems(hero,ItMi_UltharsHolyWater_Mis) && (ShrineIsObsessed == TRUE))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_HEALSHRINE_Info()
{
	var string ShrinesText;
	var string ShrinesLeft;
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_Heal_Cast");
	SHRINEHEALING = TRUE;
	C_IsShrineObsessed(self);
	SHRINEHEALING = FALSE;
	ShrinesHealed = ShrinesHealed + 1;
	if(ShrinesHealed < 7)
	{
		RankPoints = RankPoints + 1;
		B_Say(self,self,"$HEALSHRINE");
		ShrinesLeft = IntToString(7 - ShrinesHealed);
		ShrinesText = ConcatStrings(ShrinesLeft,PRINT_NumberLeft);
		AI_Print(ShrinesText);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 1;
	}
	else
	{
		B_Say(self,self,"$HEALLASTSHRINE");
		MIS_Ulthar_HeileSchreine_PAL = LOG_SUCCESS;
	};
	B_GivePlayerXP(XP_Ambient);
	b_endproductiondialog();
};

func void PrayShrine_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		C_IsShrineObsessed(self);
		if(ShrineIsObsessed == TRUE)
		{
			//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
		B_Say(self,self,"$HELLO_INNOS");
		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PrayShrine;
		AI_ProcessInfos(her);
	};
};

instance PC_PrayShrine_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayShrine_End_Condition;
	information = PC_PrayShrine_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_PrayShrine_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};

func void PC_PrayShrine_End_Info()
{
	b_endproductiondialog();
};

instance PC_PrayShrine_Paladine(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PrayShrine_Paladine_Condition;
	information = PC_PrayShrine_Paladine_Info;
	permanent = FALSE;
	description = " Pray for paladins " ;
};


func int PC_PrayShrine_Paladine_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (MIS_MardukBeten == LOG_Running) && (Kapitel == 1) && (ShrineIsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_Paladine_Info()
{
	RankPoints = RankPoints + 1;
	AI_Print(Pray_Paladin1);
	AI_Print(Pray_Paladin2);
	AI_Print(Pray_Paladin3);
	AI_Print(Pray_Paladin4);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
};

instance PC_PrayShrine_Pray(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PrayShrine_Pray_Condition;
	information = PC_PrayShrine_Pray_Info;
	permanent = TRUE;
	description = " Pray " ;
};

func int PC_PrayShrine_Pray_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_Pray_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		AI_Print(PRINT_SCIsObsessed);
		Snd_Play("DEM_Die");
	}
	else
	{
		if(hero.guild != GIL_KDM)
		{
			if(PrayDay != Wld_GetDay())
			{
				Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);

				if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
				{
					B_GivePlayerXP(50);
					INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
				}
				else
				{
					if(hero.guild == GIL_NOV)
					{
						B_GivePlayerXP(25);
					};

					INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
				};

				RankPoints = RankPoints + 1;
				PrayDay = Wld_GetDay();
				AI_Print(Print_BlessNone);
			}
			else
			{
				AI_Print(PRINT_ENOUGHTPRAY);
			};
		}
		else
		{
			AI_Print(PRINT_BLESSNONEKDM);
		};
	};
};

instance PC_PrayShrine_Sacred(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_Sacred_Condition;
	information = PC_PrayShrine_Sacred_Info;
	permanent = TRUE;
	description = " Donate gold " ;
};

func int PC_PrayShrine_Sacred_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_Sacred_Info()
{
	Info_ClearChoices(PC_PrayShrine_Pray);
	Info_AddChoice(PC_PrayShrine_Sacred,Dialog_Back,PC_PrayShrine_Sacred_Back);

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		if(Npc_HasItems(hero,ItMi_Gold) >= 100)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...100 gold coins (+ 2 to Innos' karma) " ,PC_PrayShrine_Sacred_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 500)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...500 gold coins (+10 to Innos' karma) " ,PC_PrayShrine_Sacred_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...1000 gold coins (+20 to Innos' karma) " ,PC_PrayShrine_Sacred_BigPay);
		};
	}
	else  if (hero.guild ==  GIL_KDM )
	{	
		if(Npc_HasItems(hero,ItMi_Gold) >= 500)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...500 gold coins (+ 1 to Innos' karma) " ,PC_PrayShrine_Sacred_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...1000 gold coins (+ 5 to Innos' karma, - 5 to Beliar's karma) " ,PC_PrayShrine_Sacred_BigPay);
		};
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) >= 100)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...100 gold coins (+ 1 to Innos' karma) " ,PC_PrayShrine_Sacred_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 500)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...500 gold coins (+5 to Innos' karma) " ,PC_PrayShrine_Sacred_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(PC_PrayShrine_Sacred, " ...1000 gold coins (+10 to Innos' karma) " ,PC_PrayShrine_Sacred_BigPay);
		};
	};
};

func void PC_PrayShrine_Sacred_Back()
{
	Info_ClearChoices(PC_PrayShrine_Sacred);
};

func void PC_PrayShrine_Sacred_SmallPay()
{
	B_Say(self,self,"$SACR_INNOS");
	Npc_RemoveInvItems(hero,ItMi_Gold,100);
	RankPoints = RankPoints + 1;

	if(hero.guild != GIL_KDM)
	{
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
			AI_Print(Print_BlessSacred);
		}
		else
		{
			Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
			AI_Print(Print_BlessSacred);
		};
	}
	else
	{
		AI_Print(PRINT_BLESSNONEKDM);
	};

	Info_ClearChoices(PC_PrayShrine_Sacred);
};

func void PC_PrayShrine_Sacred_MediumPay()
{
	B_Say(self,self,"$SACR_INNOS");
	Npc_RemoveInvItems(hero,ItMi_Gold,500);
	RankPoints = RankPoints + 1;

	if(hero.guild != GIL_KDM)
	{
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 10;
			AI_Print(Print_BlessSacred);
		}
		else
		{
			Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			AI_Print(Print_BlessSacred);
		};
	}
	else
	{
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
		AI_Print(Print_BlessSacred);
	};

	Info_ClearChoices(PC_PrayShrine_Sacred);
};

func void PC_PrayShrine_Sacred_BigPay()
{
	B_Say(self,self,"$SACR_INNOS");
	Npc_RemoveInvItems(hero,ItMi_Gold,1000);
	RankPoints = RankPoints + 1;

	if(hero.guild != GIL_KDM)
	{
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 20;
			AI_Print(Print_BlessSacred);
		}
		else
		{
			Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 10;
			AI_Print(Print_BlessSacred);
		};
	}
	else
	{
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 5;
		AI_Print(Print_BlessSacred);
	};

	Info_ClearChoices(PC_PrayShrine_Sacred);
};

instance PC_PrayShrine_RaiseAttribute(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_PrayShrine_RaiseAttribute_Condition;
	information = PC_PrayShrine_RaiseAttribute_Info;
	permanent = TRUE;
	description = " Dary Innosa " ;
};

func int PC_PrayShrine_RaiseAttribute_Condition()
{
	be int IsKarma;

	IsKarma = INNOSPRAYCOUNT - INNOSCRIMECOUNT;

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (IsKarma >= 50) && (ShrineIsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_RaiseAttribute_Info()
{
	var int TempMaxUpGod;

	if(hero.level >= 10)
	{
		TempMaxUpGod = hero.level / 10;
	}
	else
	{
		TempMaxUpGod = 0;
	};

	if(TempMaxUpGod > MaxUpGod)
	{
		Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
		Info_AddChoice(PC_PrayShrine_RaiseAttribute,Dialog_Back,PC_PrayShrine_RaiseAttribute_Back);
		Info_AddChoice(PC_PrayShrine_RaiseAttribute, " Grant me strength (Strength: +10, Karma Required: 100) " ,PC_PrayShrine_RaiseAttribute_STR);
		Info_AddChoice(PC_PrayShrine_RaiseAttribute, " Grant Me Agility (Agility: +5, Requires Karma: 100) " ,PC_PrayShrine_RaiseAttribute_DEX);
		Info_AddChoice(PC_PrayShrine_RaiseAttribute, " Grant me magical power (Mana: +20, Requires Karma: 100) " ,PC_PrayShrine_RaiseAttribute_MANA);
		Info_AddChoice(PC_PrayShrine_RaiseAttribute, " Grant me life force (Health: +30, Requires Karma: 100) " ,PC_PrayShrine_RaiseAttribute_HP);
		Info_AddChoice(PC_PrayShrine_RaiseAttribute, " Grant Me Wisdom (Int: +5, Requires Karma: 50) " ,PC_PrayShrine_RaiseAttribute_INT);

		if(ATR_STAMINA_MAX[0] <= 90)
		{
			Info_AddChoice(PC_PrayShrine_RaiseAttribute, " Grant Me Stamina (Stamina: +10, Karma Required: 50) " ,PC_PrayShrine_RaiseAttribute_STM);
		};
	}
	else
	{
		AI_PrintClr( " You're not ready for this yet... " , 177 , 58 , 17 );
		B_Say(self,self,"$DONTREADYFORTHIS");
	};
};

func void PC_PrayShrine_RaiseAttribute_Back()
{
	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

func void PC_PrayShrine_RaiseAttribute_STR()
{
	if(INNOSPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_STR");
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_STRENGTH,10);
		MaxUpGod +=  1 ;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaInnos,177,58,17);
	};

	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

func void PC_PrayShrine_RaiseAttribute_DEX()
{
	if(INNOSPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_DEX");
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_DEXTERITY,5);
		MaxUpGod +=  1 ;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaInnos,177,58,17);
	};

	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

func void PC_PrayShrine_RaiseAttribute_MANA()
{
	if(INNOSPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_MANA");
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_MANA_MAX,20);
		MaxUpGod +=  1 ;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaInnos,177,58,17);
	};

	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

func void PC_PrayShrine_RaiseAttribute_HP()
{
	if(INNOSPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_HP");
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,30);
		MaxUpGod +=  1 ;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaInnos,177,58,17);
	};

	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

func void PC_PrayShrine_RaiseAttribute_INT()
{
	if(INNOSPRAYCOUNT >= 50)
	{
		B_Say(self,self,"$BLESSED_INT");
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 50;
		ATR_INTELLECT += 5;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 5 " );
		MaxUpGod +=  1 ;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaInnos,177,58,17);
	};

	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

func void PC_PrayShrine_RaiseAttribute_STM()
{
	if(INNOSPRAYCOUNT >= 50)
	{
		B_Say(self,self,"$BLESSED_STAMINA");
		Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 50;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + 100;

		if(ATR_STAMINA_MAX[0] > 100)
		{
			ATR_STAMINA_MAX[0] = 100;
		};
		if(ATR_STAMINA[0] > 1000)
		{
			ATR_STAMINA_MAX[0] = 1000;
		};

		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
		AI_Print( " Endurance + 10 " );
		MaxUpGod +=  1 ;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaInnos,177,58,17);
	};

	Info_ClearChoices(PC_PrayShrine_RaiseAttribute);
};

instance PC_PrayShrine_BlessSword(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PrayShrine_BlessSword_Condition;
	information = PC_PrayShrine_BlessSword_Info;
	permanent = TRUE;
	description = Bless_Sword;
};

func int PC_PrayShrine_BlessSword_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE) && (hero.guild == GIL_PAL) && (Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500) && ((Npc_HasItems(hero,ItMw_1H_Blessed_01) >= 1) || (Npc_HasItems(hero,ItMw_2H_Blessed_01) >= 1)))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_BlessSword_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		AI_Print(PRINT_SCIsObsessed);
		Snd_Play("DEM_Die");
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= Gold_BlessSword)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,Gold_BlessSword);
		concatDonation = ConcatStrings(IntToString(Gold_BlessSword),PRINT_GoldGegeben);
		AI_Print(concatDonation);
		RankPoints = RankPoints + 1;

		if(Npc_HasItems(hero,ItMw_2H_Blessed_01) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_2H_Blessed_01,1);
			CreateInvItems(hero,ItMw_2H_Blessed_02,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("BLESSED_WEAPON");
			B_GivePlayerXP(XP_SwordBlessed);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItMw_1H_Blessed_01,1);
			CreateInvItems(hero,ItMw_1H_Blessed_02,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("BLESSED_WEAPON");
			B_GivePlayerXP(XP_SwordBlessed);
		};
	}
	else
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
	};
};

instance PC_PrayShrine_BlessSword_Final(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PrayShrine_BlessSword_Final_Condition;
	information = PC_PrayShrine_BlessSword_Final_Info;
	permanent = TRUE;
	description = Bless_Sword2;
};

func int PC_PrayShrine_BlessSword_Final_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE) && (hero.guild == GIL_PAL) && (Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500) && (PAL_KnowsAbout_FINAL_BLESSING == TRUE) && ((Npc_HasItems(hero,ItMw_1H_Blessed_02) >= 1) || (Npc_HasItems(hero,ItMw_2H_Blessed_02) >= 1)))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_BlessSword_Final_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		AI_Print(PRINT_SCIsObsessed);
		Snd_Play("DEM_Die");
	}
	else if((Npc_HasItems(hero,ItPo_PotionOfDeath_01_Mis) >= 1) || (Npc_HasItems(hero,ItPo_PotionOfDeath_02_Mis) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
		Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
		RankPoints = RankPoints + 1;

		if(Npc_HasItems(hero,ItMw_2H_Blessed_02) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_2H_Blessed_02,1);
			CreateInvItems(hero,ItMw_2H_Blessed_03,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("BLESSED_WEAPON");
			B_GivePlayerXP(XP_SwordBlessed2);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItMw_1H_Blessed_02,1);
			CreateInvItems(hero,ItMw_1H_Blessed_03,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("BLESSED_WEAPON");
			B_GivePlayerXP(XP_SwordBlessed2);
		};
	}
	else
	{
		AI_PrintClr(PRINT_NoInnosTears,177,58,17);
	};
};


var string mis_goldupgrade_pal_m_text;
var string mis_goldupgrade_pal_h_text;

var int mis_crimevalue;

instance PC_PRAYSHRINE_BLESSARMOR(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_prayshrine_blessarmor_condition;
	information = pc_prayshrine_blessarmor_info;
	permanent = TRUE;
	description = " Sanctify Armor " ;
};

func int pc_prayshrine_blessarmor_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE) && (MARDUK_CANTEACHARMOR == TRUE) && (MARDUK_BOOKREAD == TRUE) && ((EQUIPBLESSEDARMOR_M2 == FALSE) || (EQUIPBLESSEDARMOR_H2 == FALSE)))
	{
		return TRUE;
	};
};

func void pc_prayshrine_blessarmor_info()
{
	Info_ClearChoices(pc_prayshrine_blessarmor);
	Info_AddChoice(pc_prayshrine_blessarmor,Dialog_Back,pc_prayshrine_blessarmor_back);

	if(Npc_HasItems(hero,itar_pal_m_v15) >= 1)
	{
		if(Npc_GetInvItem(other,itar_pal_m_v2))
		{
			AI_Print( " You already have a consecrated knight's ore armor! " );
		}
		else
		{
			MIS_GOLDUPGRADE_PAL_M = (10000 + (INNOSCRIMECOUNT * 50)) - (INNOSPRAYCOUNT * 100);

			if(MIS_GOLDUPGRADE_PAL_M < 1000)
			{
				MIS_GOLDUPGRADE_PAL_M = 1000;
			};
			MIS_GOLDUPGRADE_PAL_M_TEXT = ConcatStrings( " Consecrate Knight's Ore Armor (Cost: " ,IntToString( MIS_GOLDUPGRADE_PAL_M ));
			MIS_GOLDUPGRADE_PAL_M_TEXT = ConcatStrings(MIS_GOLDUPGRADE_PAL_M_TEXT," монет)");
			Info_AddChoice(pc_prayshrine_blessarmor,MIS_GOLDUPGRADE_PAL_M_TEXT,pc_prayshrine_blessarmor_pal_m);
		};
	};
	if(Npc_HasItems(hero,itar_pal_h_v15) >= 1)
	{
		if(Npc_GetInvItem(other,itar_pal_h_v2))
		{
			AI_Print( " You already have a consecrated ore paladin armor! " );
		}
		else
		{
			MIS_GOLDUPGRADE_PAL_H = (15000 + (INNOSCRIMECOUNT * 50)) - (INNOSPRAYCOUNT * 100);
			if(MIS_GOLDUPGRADE_PAL_H < 2000)
			{
				MIS_GOLDUPGRADE_PAL_H = 2000;
			};
			MIS_GOLDUPGRADE_PAL_H_TEXT = ConcatStrings( " Consecrate Paladin Ore Armor (Cost: " ,IntToString( MIS_GOLDUPGRADE_PAL_H ));
			MIS_GOLDUPGRADE_PAL_H_TEXT = ConcatStrings(MIS_GOLDUPGRADE_PAL_H_TEXT," монет)");
			Info_AddChoice(pc_prayshrine_blessarmor,MIS_GOLDUPGRADE_PAL_H_TEXT,pc_prayshrine_blessarmor_pal_h);
		};
	};
};

func void pc_prayshrine_blessarmor_back()
{
	Info_ClearChoices(pc_prayshrine_blessarmor);
};

func void pc_prayshrine_blessarmor_pal_m()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= MIS_GOLDUPGRADE_PAL_M)
	{
		if(INNOSCRIMECOUNT >= INNOSPRAYCOUNT)
		{
			MIS_CRIMEVALUE = INNOSCRIMECOUNT - INNOSPRAYCOUNT;
		}
		else
		{
			MIS_CRIMEVALUE = 0;
		};
		if(MIS_CRIMEVALUE <= 10)
		{
			RankPoints = RankPoints + 1;
			AI_Print(PRINT_BLESSARMOR_1);
			AI_Print(PRINT_BLESSARMOR_2);
			AI_Print(PRINT_BLESSARMOR_3);
			AI_Print(PRINT_BLESSARMOR_4);
			Snd_Play("SFX_HealObsession");
			Npc_RemoveInvItems(hero,ItMi_Gold,MIS_GOLDUPGRADE_PAL_M);
			CreateInvItems(hero,itar_pal_m_v2,1);
			AI_Wait(hero,15);
			// AI_Print(PRINT_BLESSARMOROK);
			AI_PrintClr(PRINT_BLESSARMOROK,83,152,48);
			AI_EquipArmor(hero,itar_pal_m_v2);
			Npc_RemoveInvItems(hero,itar_pal_m_v15,Npc_HasItems(hero,itar_pal_m_v15));
			EQUIPBLESSEDARMOR_M2 = TRUE;
			B_LogEntry( TOPIC_MAGICINNOSARMOR , " I performed the ritual of consecrating the knight's ore armor! Innos heard my prayer and accepted my offering. " );
			Log_SetTopicStatus(TOPIC_MAGICINNOSARMOR,LOG_SUCCESS);
		}
		else
		{
			AI_Print(PRINT_BLESSARMOR_1);
			AI_Print(PRINT_BLESSARMOR_2);
			AI_Print(PRINT_BLESSARMOR_3);
			AI_Print(PRINT_BLESSARMOR_4);
			AI_Wait(hero,15);
			AI_PrintClr(PRINT_NOBLESSARMOR,177,58,17);
		};
	}
	else
	{
		AI_PrintClr(PRINT_BLESSARMORNOMONEY,177,58,17);
		Info_ClearChoices(pc_prayshrine_blessarmor);
	};
};

func void pc_prayshrine_blessarmor_pal_h()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= MIS_GOLDUPGRADE_PAL_H)
	{
		if(INNOSCRIMECOUNT >= INNOSPRAYCOUNT)
		{
			MIS_CRIMEVALUE = INNOSCRIMECOUNT - INNOSPRAYCOUNT;
		}
		else
		{
			MIS_CRIMEVALUE = 0;
		};
		if(MIS_CRIMEVALUE <= 10)
		{
			RankPoints = RankPoints + 1;
			AI_Print(PRINT_BLESSARMOR_1);
			AI_Print(PRINT_BLESSARMOR_2);
			AI_Print(PRINT_BLESSARMOR_3);
			AI_Print(PRINT_BLESSARMOR_4);
			Snd_Play("SFX_HealObsession");
			Npc_RemoveInvItems(hero,ItMi_Gold,MIS_GOLDUPGRADE_PAL_H);
			CreateInvItems(hero,itar_pal_h_v2,1);
			AI_Wait(hero,15);
			AI_PrintClr(PRINT_BLESSARMOROK,83,152,48);
			AI_EquipArmor(hero,itar_pal_h_v2);
			Npc_RemoveInvItems(hero,itar_pal_h_v15,Npc_HasItems(hero,itar_pal_h_v15));
			EQUIPBLESSEDARMOR_H2 = TRUE;
			B_LogEntry( TOPIC_MAGICINNOSARMOR , " I performed the ritual of consecrating the paladin's ore armor! Innos heard my prayer and accepted my offering. " );
			Log_SetTopicStatus(TOPIC_MAGICINNOSARMOR,LOG_SUCCESS);
		}
		else
		{
			AI_Print(PRINT_BLESSARMOR_1);
			AI_Print(PRINT_BLESSARMOR_2);
			AI_Print(PRINT_BLESSARMOR_3);
			AI_Print(PRINT_BLESSARMOR_4);
			AI_Wait(hero,15);
			AI_PrintClr(PRINT_NOBLESSARMOR,177,58,17);
		};
	}
	else
	{
		AI_PrintClr(PRINT_BLESSARMORNOMONEY,177,58,17);
		Info_ClearChoices(pc_prayshrine_blessarmor);
	};
};

instance PC_PRAYSHRINE_PRAYFORGOMEZ(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayshrine_prayforgomez_condition;
	information = pc_prayshrine_prayforgomez_info;
	permanent = TRUE;
	description = " Pray for Gomez's soul " ;
};

func int pc_prayshrine_prayforgomez_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE) && (CHECKSHV == FALSE) && (MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYINNOS == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayshrine_prayforgomez_info()
{
	var string concatText;

 	if ( InnosBonus ==  FALSE )
	{
		if(INNOSCRIMECOUNT > INNOSPRAYCOUNT)
		{
			Snd_Play("SFX_HealObsession");
			AI_Wait(hero,3);
			concatText = " Pray for your soul, sinner! " ;
			AI_Print(concatText);
		}
		else
		{
			RankPoints = RankPoints + 1;
			concatText = " Innos pardons the soul of Gomez! " ;
			Snd_Play("SFX_HealObsession");
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			AI_Print(concatText);
			RESCUEGOMEZPRAYINNOS = TRUE;
			B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from Innos. " );
	
			if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
			{
				RESCUEGOMEZSTEPONEDONE = TRUE;
				RESCUEGOMEZSTEPTWO = TRUE;
				Log_AddEntry( TOPIC_RESCUEGOMEZ , " I have received forgiveness for Gomez's soul from all the gods! Now I must go to the Old Mine. " );
			};
		};
	}
	else
	{
		RankPoints = RankPoints + 1;
		concatText = " Innos pardons the soul of Gomez! " ;
		Snd_Play("SFX_HealObsession");
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		AI_Print(concatText);
		RESCUEGOMEZPRAYINNOS = TRUE;
		B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from Innos. " );
	
		if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
		{
			RESCUEGOMEZSTEPONEDONE = TRUE;
			RESCUEGOMEZSTEPTWO = TRUE;
			Log_AddEntry( TOPIC_RESCUEGOMEZ , " I have received forgiveness for Gomez's soul from all the gods! Now I must go to the Old Mine. " );
		};
	};
};

var int  INNOSSAYHISWILL ;

instance PC_PRAYSHRINE_PRAYFORPOWER(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayshrine_prayforpower_condition;
	information = pc_prayshrine_prayforpower_info;
	permanent = TRUE;
	description = " Ask to grant strength and power " ;
};

func int pc_prayshrine_prayforpower_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (ShrineIsObsessed == FALSE) && (CHECKSHV == FALSE) && (NETBEKLEADME_STEP1 == TRUE) && (INNOSGIVEPOWER == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayshrine_prayforpower_info()
{
	if(INNOSSAYHISWILL == TRUE)
	{
		if(KreolIsDead == TRUE)
		{
			B_Say(self,self,"$INNOSGIVEPOWERDONE");
			INNOSCRIMECOUNT = 0;

			if(INNOSPRAYCOUNT < 500)
			{
				INNOSPRAYCOUNT = 500;
			};

			RankPoints = RankPoints + 1;
			b_giveplayerxpquiet(5000);
			Snd_Play("SFX_HealObsession");
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_Print(PRINT_INNOSGIVEPOWER);
			INNOSGIVEPOWER = TRUE;
			MIS_INNOSWILL = LOG_Success;
			Log_SetTopicStatus(TOPIC_INNOSWILL,LOG_Success);
			B_LogEntry( TOPIC_GUARDIANS , " I got Innos' support. " );
			AI_Wait(hero,1);

			if((INNOSGIVEPOWER == TRUE) && (BELIARGIVEPOWER == TRUE) && (ADANOSGIVEPOWER == TRUE))
			{
				NETBEKLEADME_STEP1DONE = TRUE;
				Log_AddEntry( TOPIC_GUARDIANS , " I have now enlisted the support of all three deities by becoming their Chosen One! " );
				CreateInvItems(hero,ItAr_GodArmor,1);
				AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
				AI_Wait(hero,3);
				AI_EquipArmor(hero,ItAr_GodArmor);
			};
		}
		else
		{
			AI_Print(PRINT_DOWILLINNOS);
		};
	}
	else
	{
		B_Say(self,self,"$INNOSGIVEPOWERWILL");
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		ENJOYINGHISWILL = TRUE ;
		MIS_INNOSWILL = LOG_Running;
		Log_CreateTopic(TOPIC_INNOSWILL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INNOSWILL,LOG_Running);
		B_LogEntry( TOPIC_INNOSWILL , " Innos wants me to kill Beliar's servant! Hmmm...haven't I sent them all to hell yet?! " );
		AI_Wait(hero,1);
	};

	b_endproductiondialog();
};

instance PC_PRAYSHRINE_BELIARCURSE(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayshrine_beliarcurse_condition;
	information = pc_prayshrine_beliarcurse_info;
	permanent = TRUE;
	description = " Ask to remove Beliar's curse " ;
};

func int pc_prayshrine_beliarcurse_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);
	if (( PLAYER_MOBSI_PRODUCTION  == MOBSI_PrayShrine ) && ( ShrineIsObsessed ==  FALSE ) && ( CHECKSHV  ==  FALSE ) && ( PYRIKARSENDALTAR  ==  TRUE ) && ( MIS_BELIARCURSE  == LOG_Running ) && ( BELIARCURSEYOU  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void pc_prayshrine_beliarcurse_info()
{
	var int carminous;
	karmainnos = INNOSPRAYCOUNT  -  INNOSCRIMECOUNT ;
	AI_Print( " Innos, save me and help lift Beliar's curse!... " );

	if (carmainnos >=  25 )
	{
		AI_Wait(hero,5);
		b_giveplayerxpquiet(100);
		Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("BLESSED_WEAPON");
		AI_PrintClr(PRINT_BLESSCURSEOK,83,152,48);
		BELIARCURSEYOU = FALSE;
		MIS_BELIARCURSE = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BELIARCURSE,LOG_SUCCESS);
		B_LogEntry( TOPIC_BELIARCURSE , " Innos seems to have heard my pleas for help and lifted the curse that Beliar placed on me! " );
	}
	else
	{
		AI_Wait(hero,5);
		AI_PrintClr(PRINT_BLESSCURSENO,177,58,17);
	};
};


instance PC_PRAYIDOL_PRAY_ROBA2(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_pray_roba2_condition;
	information = pc_pray_roba2_info;
	permanent = TRUE;
	description = " Sanctify High Firemage 's Robe " ;
};

func int pc_pray_roba2_condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  == MOBSI_PrayShrine) && (ShrineIsObsessed ==  FALSE ) && (hero.guild ==  GIL_KDF ) && ( HEROKNOWS_BLESSED_ROBS  ==  TRUE ) && ( CHECKSHV  ==  FALSE ) && (Npc_HasItems(hero,ItMi_HolyWater )) > =  . && (Npc_HasItems(hero,ItAr_KDF_H)))
	{
		return TRUE;
	};
};


func int give_roba_innos_1()
{
	AI_Wait(hero,2);
	B_GivePlayerXP(300);
	Snd_Play("BLESSED_WEAPON");
	Npc_RemoveInvItems(hero,ItMi_HolyWater,35);
	CreateInvItems(hero,itar_kdf_h_blessed,1);
	AI_EquipArmor(hero,itar_kdf_h_blessed);
	Npc_RemoveInvItems(hero,ItAr_KDF_H,1);
	AI_Print( " Innos has blessed your robe... " );
	Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	return  1 ;
};

func void pc_pray_roba2_info()
{
	if(INNOSPRAYCOUNT >= 100)
	{
		give_roba_innos_1();
	}
	else
	{
		AI_Print( " Looks like Innos isn't good enough for me for this... " );
	};
};
