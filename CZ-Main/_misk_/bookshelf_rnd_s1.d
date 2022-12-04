

func void bookshelf_rnd_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_BOOKSHELF;
		AI_ProcessInfos(her);
	};
};

instance PC_BOOKSHELF_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_bookshelf_end_condition;
	information = pc_bookshelf_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};


func int pc_bookshelf_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BOOKSHELF)
	{
		return TRUE;
	};
};

func void pc_bookshelf_end_info()
{
	b_endproductiondialog();
};

var int rnd_shelf_l;
var int Found_OneHandBook;
var int Found_TwoHandBook;

instance PC_BOOKSHELF_RND(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_bookshelf_rnd_condition;
	information = pc_bookshelf_rnd_info;
	permanent = TRUE;
	description = " Explore bookshelf " ;
};

func int pc_bookshelf_rnd_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BOOKSHELF)
	{
		return TRUE;
	};
};

func void pc_bookshelf_rnd_info()
{
	var int rnd_shelf2;
	var int DayNowScroll;

	if((Hlp_StrCmp(Npc_GetNearestWP(hero),"DT_E2_03")) || (Hlp_StrCmp(Npc_GetNearestWP(hero),"OW_HIDE_BOOK")))
	{
		if((Hlp_StrCmp(Npc_GetNearestWP(hero),"DT_E2_03")) && (Found_OneHandBook == FALSE))
		{
			Found_OneHandBook = TRUE;
			CreateInvItems(hero,ItWr_EinhandBuch, 1 );
			AI_Print( " You found the book 'Defense of the Southern Lands'! " );
		}
		else	if((Hlp_StrCmp(Npc_GetNearestWP(hero),"OW_HIDE_BOOK")) && (Found_TwoHandBook == FALSE))
		{
			Found_TwoHandBook = TRUE;
			CreateInvItems(hero,ItWr_ZweihandBuch,1);
			AI_Print( " You found the 'Double Block' book! " );
		}
		else
		{
			AI_Print( " You found nothing... " );
		};
	}
	else
	{
		DayNowScroll = Wld_GetDay();

		if(RND_SHELF_L <= (DayNowScroll - 1))
		{
			if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0)
			{
				rnd_shelf2 = Hlp_Random(9);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_FireBolt,1);
					AI_Print( " You found the 'Fire Arrow' scroll! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_Zap,1);
					AI_Print( " You found the 'Lightning' scroll! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_Icebolt,1);
					AI_Print( " You found the 'Ice Arrow' scroll! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_Sleep,1);
					AI_Print( " You found the 'Sleep' scroll! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Deathbolt,1);
					AI_Print( " You found the 'Dark Arrow' scroll! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_SumGobSkel,1);
					AI_Print( " You found the scroll 'Summon Goblin Skeleton'! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Light,1);
					AI_Print( " You found the 'Light' scroll! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_LightHeal,1);
					AI_Print( " You found the 'Healing' scroll! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfScavenger,1);
					AI_Print( " You have found the 'Bloodfly Transformation' scroll! " );
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
			{
				rnd_shelf2 = Hlp_Random(11);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_SumWolf,1);
					AI_Print( " You found the 'Wolf Summon' scroll! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_MediumHeal,1);
					AI_Print( " You have found the 'Purifying Light' scroll! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_HarmUndead,1);
					AI_Print( " You have found the 'Destruction of the Undead' scroll! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_InstantFireball,1);
					AI_Print( " You found the 'Fireball' scroll! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Icelance,1);
					AI_Print( " You found the 'Ice Spear' scroll! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_SUMSHOAL,1);
					AI_Print( " You found the scroll 'Summoning the Ice Wolf Pack'! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Windfist,1);
					AI_Print( " You found the 'Wind Fist' scroll! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_GreenTentacle,1);
					AI_Print( " You found the 'Tangled Roots' scroll! " );
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_ManaForLife,1);
					AI_Print( " You found the 'Soul Tearing' scroll! " );
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_SumZombie,1);
					AI_Print( " You found the 'Zombie Summons' scroll! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfSnapper,1);
					AI_Print( " You have found the scroll 'Transformation in the Snapper'! " );
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
			{
				rnd_shelf2 = Hlp_Random(18);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_FullHeal,1);
					AI_Print( " You found the 'Light of Innos' scroll! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_Firestorm,1);
					AI_Print( " You found the 'Little Firestorm' scroll! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_IceCube,1);
					AI_Print( " You found the 'Ice Block' scroll! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_ThunderBall,1);
					AI_Print( " You found the 'Ball Lightning' scroll! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Fear,1);
					AI_Print( " You found the 'Fear' scroll! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_CHARM,1);
					AI_Print( " You found the 'Oblivion' scroll! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Swarm,1);
					AI_Print( " You found the scroll 'Insect Swarm'! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_SumSkel,1);
					AI_Print( " You have found the 'Skeleton Warrior Summons' scroll! " );
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_SumGol,1);
					AI_Print( " You found the scroll 'Summon the Stone Guardian'! " );
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_SUMFIREGOL,1);
					AI_Print( " You found the scroll 'Summon Fire Golem'! " );
				}
				else if(rnd_shelf2 == 10)
				{
					CreateInvItems(hero,ItSc_TrfFireWaran,1);
					AI_Print( " You have found the 'Transform into a Lizard' scroll! " );
				}
				else if(rnd_shelf2 == 11)
				{
					CreateInvItems(hero,ItSc_ChargeFireball,1);
					AI_Print( " You found the 'Great Fireball' scroll! " );
				}
				else if(rnd_shelf2 == 12)
				{
					CreateInvItems(hero,ItSc_LightningFlash,1);
					AI_Print( " You found the 'Lightning Strike' scroll! " );
				}
				else if(rnd_shelf2 == 13)
				{
					CreateInvItems(hero,ItSc_SUMICEGOL,1);
					AI_Print( " You found the 'Ice Golem Summons' scroll! " );
				}
				else if(rnd_shelf2 == 14)
				{
					CreateInvItems(hero,ItSc_Whirlwind,1);
					AI_Print( " You found the 'Tornado' scroll! " );
				}
				else if(rnd_shelf2 == 15)
				{
					CreateInvItems(hero,ItSc_SumDemon,1);
					AI_Print( " You found the 'Summon Demon' scroll! " );
				}
				else if(rnd_shelf2 == 16)
				{
					CreateInvItems(hero,ItSc_Deathball,1);
					AI_Print( " You found the 'Orb of Death' scroll! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfWarg,1);
					AI_Print( " You have found the scroll 'Transform into Warga'! " );
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 3)
			{
				rnd_shelf2 = Hlp_Random(11);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_Waterfist,1);
					AI_Print( " You found the 'Water Fist' scroll! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_IceWave,1);
					AI_Print( " You found the 'Ice Wave' scroll! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_ArmyOfDarkness,1);
					AI_Print( " You found the 'Army of Darkness' scroll! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_Whirlwind,1);
					AI_Print( " You found the 'Tornado' scroll! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_SUMSWPGOL,1);
					AI_Print( " You found the 'Swamp Golem Summons' scroll! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_TrfShadowbeast,1);
					AI_Print( " You found the 'Shadow Beast Transformation' scroll! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Firerain,1);
					AI_Print( " You found the 'Rain of Fire' scroll! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_Geyser,1);
					AI_Print( " You found the 'Geyser' scroll! " );
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_Thunderstorm,1);
					AI_Print( " You found the 'Storm' scroll! " );
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_MassDeath,1);
					AI_Print( " You found the 'Black Mist' scroll! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_Skull,1);
					AI_Print( " You found the 'Roar of the Dead' scroll! " );
				};
			};

			RND_SHELF_L = Wld_GetDay();
		}
		else
		{
			AI_Print( " You found nothing... " );
		};
	};

	b_endproductiondialog();
};
