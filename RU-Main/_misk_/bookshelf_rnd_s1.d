

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
	description = " Search the bookshelf. " ;
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
			AI_Print( "The book 'Defense of the Southern Lands' was found! " );
		}
		else	if((Hlp_StrCmp(Npc_GetNearestWP(hero),"OW_HIDE_BOOK")) && (Found_TwoHandBook == FALSE))
		{
			Found_TwoHandBook = TRUE;
			CreateInvItems(hero,ItWr_ZweihandBuch,1);
			AI_Print( " Book 'Double block' found! " );
		}
		else
		{
			AI_Print( " Nothing found! " );
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
					AI_Print( " Found magic scroll 'Fire Arrow'! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_Zap,1);
					AI_Print( " Found magic scroll 'Lightning'! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_Icebolt,1);
					AI_Print( " Frostbolt magic scroll found! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_Sleep,1);
					AI_Print( " Found magic scroll 'Sleep'! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Deathbolt,1);
					AI_Print( " Found the magic scroll 'Dark Arrow'! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_SumGobSkel,1);
					AI_Print( " Summon Skeleton Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Light,1);
					AI_Print( " Found magic scroll 'Light'! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_LightHeal,1);
					AI_Print( " Found magic scroll 'Healing'! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfScavenger,1);
					AI_Print( " Found the magic scroll 'Transformation into a Hornet'! " );
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
			{
				rnd_shelf2 = Hlp_Random(11);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_SumWolf,1);
					AI_Print( " Found magic scroll 'Summon Warg'! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_MediumHeal,1);
					AI_Print( " Found the magic scroll 'Cleansing Light'! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_HarmUndead,1);
					AI_Print( " Found magic scroll 'Destroy undead'! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_InstantFireball,1);
					AI_Print( " Found magic scroll 'Fireball'! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Icelance,1);
					AI_Print( " Found magic scroll 'Ice Spear'! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_SUMSHOAL,1);
					AI_Print( " Summon Snow Swarm Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Windfist,1);
					AI_Print( " Wind Fist Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_GreenTentacle,1);
					AI_Print( " Found the magic scroll 'Entangle Roots'! " );
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_ManaForLife,1);
					AI_Print( " Soul Rend Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_SumZombie,1);
					AI_Print( " Summon Zombie Magic Scroll Found! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfSnapper,1);
					AI_Print( " Glorcha Transformation Magic Scroll Found! " );
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
			{
				rnd_shelf2 = Hlp_Random(18);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_FullHeal,1);
					AI_Print( " Found magic scroll 'Spring of Vivacity'! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_Firestorm,1);
					AI_Print( " Firestorm magic scroll found! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_IceCube,1);
					AI_Print( " Found the magic scroll 'Ice Block'! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_ThunderBall,1);
					AI_Print( " Found magic scroll 'Thunderball'! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_Fear,1);
					AI_Print( " Fear magic scroll found! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_CHARM,1);
					AI_Print( " Found magic scroll 'Oblivion'! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Swarm,1);
					AI_Print( " Found the magic scroll 'Roy'! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_SumSkel,1);
					AI_Print( " Summon Skeleton Warrior Magic Scroll found! " );
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_SumGol,1);
					AI_Print( " Found magic scroll 'Summon Stone Golem'! " );
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_SUMFIREGOL,1);
					AI_Print( " Found magic scroll 'Summon Fire Golem'! " );
				}
				else if(rnd_shelf2 == 10)
				{
					CreateInvItems(hero,ItSc_TrfFireWaran,1);
					AI_Print( " Found the magic scroll 'Fire Lizard Transformation'! " );
				}
				else if(rnd_shelf2 == 11)
				{
					CreateInvItems(hero,ItSc_ChargeFireball,1);
					AI_Print( " Great fireball magic scroll found! " );
				}
				else if(rnd_shelf2 == 12)
				{
					CreateInvItems(hero,ItSc_LightningFlash,1);
					AI_Print( " Found magic scroll 'Thunderbolt'! " );
				}
				else if(rnd_shelf2 == 13)
				{
					CreateInvItems(hero,ItSc_SUMICEGOL,1);
					AI_Print( " Summon Ice Golem Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 14)
				{
					CreateInvItems(hero,ItSc_Whirlwind,1);
					AI_Print( " Found magic scroll 'Tornado'! " );
				}
				else if(rnd_shelf2 == 15)
				{
					CreateInvItems(hero,ItSc_SumDemon,1);
					AI_Print( " Summon Demon Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 16)
				{
					CreateInvItems(hero,ItSc_Deathball,1);
					AI_Print( "The magic scroll 'Death Ball' has been found! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_TrfWarg,1);
					AI_Print( " Found magic scroll 'Transform into Warg'! " );
				};
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 3)
			{
				rnd_shelf2 = Hlp_Random(11);

				if(rnd_shelf2 == 0)
				{
					CreateInvItems(hero,ItSc_Waterfist,1);
					AI_Print( " Found magic scroll 'Water Fist'! " );
				}
				else if(rnd_shelf2 == 1)
				{
					CreateInvItems(hero,ItSc_IceWave,1);
					AI_Print( " Ice wave magic scroll found! " );
				}
				else if(rnd_shelf2 == 2)
				{
					CreateInvItems(hero,ItSc_ArmyOfDarkness,1);
					AI_Print( " Found the magic scroll 'Army of Darkness'! " );
				}
				else if(rnd_shelf2 == 3)
				{
					CreateInvItems(hero,ItSc_Whirlwind,1);
					AI_Print( " Found magic scroll 'Tornado'! " );
				}
				else if(rnd_shelf2 == 4)
				{
					CreateInvItems(hero,ItSc_SUMSWPGOL,1);
					AI_Print( " Summon Swamp Golem Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 5)
				{
					CreateInvItems(hero,ItSc_TrfShadowbeast,1);
					AI_Print( " Found the magic scroll 'Mrakoris Transformation'! " );
				}
				else if(rnd_shelf2 == 6)
				{
					CreateInvItems(hero,ItSc_Firerain,1);
					AI_Print( " Fire Rain Magic Scroll Found! " );
				}
				else if(rnd_shelf2 == 7)
				{
					CreateInvItems(hero,ItSc_Geyser,1);
					AI_Print( " Geyser magic scroll found! " );
				}
				else if(rnd_shelf2 == 8)
				{
					CreateInvItems(hero,ItSc_Thunderstorm,1);
					AI_Print( " Found magic scroll 'Storm'! " );
				}
				else if(rnd_shelf2 == 9)
				{
					CreateInvItems(hero,ItSc_MassDeath,1);
					AI_Print( " Found the magic scroll 'Black Mist'! " );
				}
				else
				{
					CreateInvItems(hero,ItSc_Skull,1);
					AI_Print( " Found the magic scroll 'Cry of the Dead'! " );
				};
			};

			RND_SHELF_L = Wld_GetDay();
		}
		else
		{
			AI_Print( " Nothing found... " );
		};
	};

	b_endproductiondialog();
};
